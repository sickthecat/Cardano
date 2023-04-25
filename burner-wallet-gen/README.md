# Cold Wallet / burner wallet seed phrases.

This script generates 24-word Cardano-compatible mnemonic seed phrases using the `mnemonic` library in Python. The script prompts the user to specify how many seed phrases they want to generate, generates the specified number of seed phrases, and saves them to a file called `seedphrases.txt`. 

The generated seed phrases are formatted for easy copying and display the corresponding index number in the console output. The script uses the `"english"` language to generate the seed phrases and generates a random 256-bit entropy value for each seed phrase.

To use this script, the `mnemonic` library must be installed. You can install it using pip:

```
pip3 install mnemonic
```

Once installed, you can run the script using the following command:

```
python3 seed.py
```

The generated seed phrases will be saved to a file called `seedphrases.txt` in the same directory as the script.

This script is a useful tool for generating secure and reliable seed phrases for Cardano wallets. It can be used by anyone who wants to create a new Cardano wallet or generate additional seed phrases for an existing wallet.

Using this to generate seed phrases offline is recomended. 
