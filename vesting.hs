-- Vesting Contract

{-# INLINABLE mkValidator #-}
mkValidator :: () -> (DataScript -> RedeemerScript -> ValidatorCtx -> Bool)
mkValidator () ds rs = 
    let
        txInfo = scriptContextTxInfo rs
        beneficiary = beneficiaryHash ds
        mintedValue = assetClassValueOf (valuePaidTo scriptAddress txInfo) token
        currentTime = fromIntegral $ txInfoValidRangeEnd txInfo
        vestingPeriod = vestingPeriod ds
        allowedWithdrawal = if currentTime < vestingPeriod then 0 else mintedValue
        actualWithdrawal = assetClassValueOf (valueRedeemedBy $ txInfoInputs txInfo) token
    in
        traceIfFalse "Beneficiary did not sign the transaction" (txSignedBy txInfo beneficiary)
        && traceIfFalse "Incorrect amount withdrawn" (actualWithdrawal == allowedWithdrawal)

-- Vesting Contract Parameters

data VestingParams = VestingParams
    { beneficiaryHash :: PubKeyHash
    , vestingPeriod :: POSIXTime
    }

PlutusTx.unstableMakeIsData ''VestingParams

-- Vesting Contract Script

vestingContract :: VestingParams -> Script
vestingContract p = 
    let
        validator = mkValidator
        script = ValidatorScript $ validator
        address = scriptAddress script
    in
        script `PlutusTx.applyScript` PlutusTx.liftData p

-- Token Definition

data MyToken

instance HasMintingPolicy MyToken where
    type MintingPolicy MyToken = ScriptContext -> Bool
    mintingPolicy _ = True

token :: AssetClass
token = assetClass (scriptCurrencySymbol vestingContract) "MyToken"

-- Example Usage

vestingParams :: VestingParams
vestingParams = VestingParams 
    { beneficiaryHash = "abcd1234" -- replace with desired public key hash
    , vestingPeriod = 365 * 24 * 60 * 60 -- 1 year in seconds
    }

vestingContractScript :: Script
vestingContractScript = vestingContract vestingParams

vestingContractAddress :: Address
vestingContractAddress = scriptAddress vestingContractScript
