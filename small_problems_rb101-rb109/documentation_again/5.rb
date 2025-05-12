a = %w(a b c d e)

# The "%w()" literal is one way to create an array of strings in Ruby. Each element provided within the parentheses will be a string element in the array created.
# The parentheses are interchangeable with square brackets; the latter is usually preferred stylistically because it looks more like an array.
# "w" stands for "words".
# From: https://ruby-doc.org/3.2/Array.html#class-Array-label-Creating+Arrays

# The Array#fetch method returns the element of a calling array at a given index. There are two ways to return default values if the index given is out-of-range: by passing a default value as an optional parameter; and by passing a block.

puts a.fetch(7)   # An exception will be raised because there are only 5 elements in our array i.e. max index 4. There is no 7th index and so an IndexError will occur.

puts a.fetch(7, 'beats me')   # 'beats me' will be printed here because it is provided as a default value and used in this instance where the index value provided is not in range.

puts a.fetch(7) { |index| index**2 }    # The block provided here is similar to a default value to be used when the index value provided is not in range. In this case, because 7 is out-of-range, our block will be executed and returned, causing 49 to be printed.