# Vesting.hs


Example based on `https://pluts.harmoniclabs.tech/docs/examples/Vesting`

This code defines a basic vesting contract that allows the beneficiary to withdraw the full amount of a specified token after a certain vesting period has elapsed. The vesting contract is parameterized by the beneficiary's public key hash and the vesting period in seconds.

To use this contract, you would need to compile and deploy the `vestingContractScript` to the Cardano blockchain, and then create a transaction that pays the desired amount of `MyToken` to the `vestingContractAddress`. Once the vesting period has elapsed, the beneficiary can then use the same public key hash to withdraw the full amount of `MyToken` from the contract.



# Compile?


To compile the Plutus code, you will need to install the Plutus development environment. You can find detailed instructions on how to install the Plutus environment on the Plutus GitHub repository: https://github.com/input-output-hk/plutus#building-and-running-the-plutus-development-environment

Once you have installed the Plutus environment, you can compile the code using the `plc` compiler. Here are the steps to follow:

1. Save the code to a file called `VestingContract.hs` (or any other name you prefer) in a directory of your choice.
2. Open a terminal and navigate to the directory where you saved the file.
3. Run the following command to compile the code:

   ```
   $ plutus-starter-dev-env nix-build -A plutus-playground.client
   $ plutus-playground-generate-purs
   $ cabal build
   ```

   This will build the Plutus Playground and generate the PureScript code for the client. It will also build the Haskell code for the vesting contract.

4. Once the compilation is complete, you can find the compiled vesting contract in the `dist-newstyle` directory. The exact location will depend on your operating system and the version of GHC you are using. You can use the `find` command to search for the compiled files:

   ```
   $ find . -name VestingContract
   ```

   This should give you the path to the compiled executable file.

5. You can then deploy the compiled vesting contract to the Cardano blockchain using a Cardano wallet or other deployment tool of your choice.
