from mnemonic import Mnemonic

# Prompt user for number of seed phrases to generate
num_seed_phrases = int(input("Enter the number of seed phrases to generate: "))

# Generate the specified number of 24-word seed phrases and save to file
with open('seedphrases.txt', 'w') as f:
    for i in range(num_seed_phrases):
        entropy = Mnemonic("english").generate(strength=256)  # generate 256 bits of entropy
        seed_phrase = entropy.split()
        formatted_seed_phrase = ' '.join(seed_phrase)
        f.write(f"Seed Phrase #{i+1}: {formatted_seed_phrase}\n")
        print(f"Seed Phrase #{i+1}: {formatted_seed_phrase}")

print("Seed phrases saved to seedphrases.txt.")
