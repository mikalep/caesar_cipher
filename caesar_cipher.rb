# frozen_string_literal: true

# Ask user to type in a phrase, then whether the user wants the phrase to be
# encrypted or decrypted, and then perform the correct action based on the answer
print 'Please enter a phrase: '

str = gets.chomp

print 'Please enter a number by which you want your phrase to be shifted: '

shift = gets.chomp.to_i

print 'Would you like this phrase to be encrypted or decrypted?
Press 1 to encrypt, 2 to decrypt: '

answer = gets.chomp.to_i

def cipher(str, shift)
  output = ''

  # Split the input to individual characters
  # and loop through each to get their ASCII value.
  str.each_char do |char|
    # Add the ASCII value + the shift factor and store the result into a variable
    shifted = char.ord + shift
    # Check whether the character is lowercase or uppercase and
    # shift and wrap with modulus if needed
    if char.ord.between?(97, 122)
      output += ('a'.ord + ((shifted - 'a'.ord) % 26)).chr
    elsif char.ord.between?(65, 90)
      output += ('A'.ord + ((shifted - 'A'.ord) % 26)).chr
    else
      output += char
    end
  end
  output
end

# Decipher the phrase.
def decipher(str, shift)
  cipher(str, -shift)
end

# If the user has not chosen to encrypt or decrypt,
# prompt them to choose one or exit the program.
while answer != 0
  if answer.eql?(1)
    puts cipher(str, shift)
    break
  elsif answer.eql?(2)
    puts decipher(str, shift)
    break
  else
    puts 'Press 1 to encrypt or 2 to decrypt. Press 0 to exit'
    answer = gets.chomp.to_i
  end
end
