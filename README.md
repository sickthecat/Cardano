# Vesting.hs

This code defines a basic vesting contract that allows the beneficiary to withdraw the full amount of a specified token after a certain vesting period has elapsed. The vesting contract is parameterized by the beneficiary's public key hash and the vesting period in seconds.

To use this contract, you would need to compile and deploy the `vestingContractScript` to the Cardano blockchain, and then create a transaction that pays the desired amount of `MyToken` to the `vestingContractAddress`. Once the vesting period has elapsed, the beneficiary can then use the same public key hash to withdraw the full amount of `MyToken` from the contract.
