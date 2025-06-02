def swap(str)
  words = str.split
  words.map! do |word|
    word[0], word[-1] = word[-1], word[0]
    word
  end
  words.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'

# Further exploration: this wouldn't work because a, b = b, a is a re-assignment of local variables a and b within the method, and therefore has no impact on the object references passed in as arguments to the method.

