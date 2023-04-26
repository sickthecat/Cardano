from mnemonic import Mnemonic

# Prompt user for number of seed phrases to generate
num_seed_phrases = int(input("Enter the number of seed phrases to generate: "))

# Prompt user for desired seed phrase length
print("Select the desired seed phrase length:")
print("1. 12 words")
print("2. 15 words")
print("3. 24 words")
length_option = int(input("Enter your choice (1, 2, or 3): "))

# Generate the specified number of seed phrases and save to file
with open('seedphrases.txt', 'w') as f:
    for i in range(num_seed_phrases):
        if length_option == 1:
            entropy = Mnemonic("english").generate(strength=128)
        elif length_option == 2:
            entropy = Mnemonic("english").generate(strength=160)
        elif length_option == 3:
            entropy = Mnemonic("english").generate(strength=256)
        else:
            print(f"Invalid seed phrase length option selected: {length_option}")
            break
        seed_phrase = entropy.split()
        formatted_seed_phrase = ' '.join(seed_phrase)
        f.write(f"Seed Phrase #{i+1}: {formatted_seed_phrase}\n")
        print(f"Seed Phrase #{i+1}: {formatted_seed_phrase}")

print("Seed phrases saved to seedphrases.txt.")
