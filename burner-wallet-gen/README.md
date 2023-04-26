# Seed Phrase Generator

This Python script generates [BIP-39](https://github.com/bitcoin/bips/blob/master/bip-0039.mediawiki) compliant seed phrases for use in cryptocurrency wallets or other applications that require a secure seed phrase.

## Features

* Generates seed phrases that are compliant with the BIP-39 standard.
* Supports generating seed phrases with 12, 15, or 24 words.
* Uses the `Mnemonic` class from the `mnemonic` library to generate seed phrases with strengths that are multiples of 32 bits.
* Saves the generated seed phrases to a file named `seedphrases.txt` in the current working directory.
* Outputs the generated seed phrases to the console for easy copying.

## Usage

1. Clone this repository or download the `seed.py` file to your local machine.
2. Install the `mnemonic` library by running `pip3 install mnemonic`.
3. Run the `seed.py` file using Python 3 by typing `python3 seed.py` in a terminal window.
4. Follow the prompts to select the number of seed phrases to generate and the desired length of each seed phrase.

## Differences from Original Code

The original code generated only 24-word seed phrases and did not prompt the user for the desired seed phrase length. The modified code adds support for generating 12-word and 15-word seed phrases, and prompts the user to select the desired length. The modified code also uses the `Mnemonic` class from the `mnemonic` library to generate the seed phrases, rather than the `eth-mnemonic` library. For 12-word and 15-word seed phrases, the closest supported strengths of 128 bits and 160 bits, respectively, are used to generate the seed phrases.
