# frozen_string_literal: true

# Ask the user to enter a phrase to be encrypted
print 'Please enter a phrase to be encrypted: '

# Assign the input from the user to a variable
str = gets.chomp

print 'Please enter a number by which you want your phrase to be shifted: '

shift = gets.chomp.to_i

def cipher(str, shift)
  output = ''

  # Split the input to individual characters
  # and loop through each to get their ASCII value.
  str.each_char do |char|
    # Add the ASCII value + the shift factor and store the result into a variable
    shifted = char.ord + shift
    # Check whether the character is lowercase or uppercase and
    # perform the shift and wrapping with modulus
    output += if char.ord.between?(97, 122)
                ('a'.ord + ((shifted - 'a'.ord) % 26)).chr
              elsif char.ord.between?(65, 90)
                ('A'.ord + ((shifted - 'A'.ord) % 26)).chr
              else
                char
              end
  end

  output
end

puts cipher(str, shift)
