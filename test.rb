VOWELS = %w(A E I O U Y)

# SEND 5 OF WHAT IS IN THE CURLY BRACES INTO A NEW ARRAY
# AN ARRAY OF 5 VOWEL ARRAYS
letters = Array.new(5) { VOWELS.sample }
# AN ARRAY OF 5 LETTER 'A'
# letters = Array.new(5) { 'A' }
letters += Array.new(5) { (('A'..'Z').to_a - VOWELS).sample }
p letters.shuffle!


# p letters

