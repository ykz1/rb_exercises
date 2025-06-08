words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

# Initial solution which iterates through each unique combination of letters and finds all the matching words:
def anagrams1(words)
  strings = words.map { |word| word.chars.sort.join }
  unique_strings = strings.uniq.to_h do |str|
    [
      str,
      words.select { |word| word.chars.sort.join == str }
    ]
  end.values
end

p anagrams1(words)

# Alternate solution which iterates through all the words and stores each into a hash based on unique letter combinations as keys:
def anagrams2(words)
  output = Hash.new { |hash, key| hash[key] = [] }
  words.each do |word|
    str = word.chars.sort.join
    output[str] << word
  end
  output.values
end

p anagrams2(words)

# Alternate one-line variation of previous solution. Note that we need to pass a block to Hash.new to initialize an empty array as the default value because if we use Hash.new([]) then the same array object would be used in all references to a default value. This is what allows us to append each word to the appropriate key's array without worrying whether that key already exists.
def anagrams3(words)
  words.each_with_object(Hash.new{ |h, k| h[k] = []}) { |word, hash| hash[word.chars.sort.join] << word }.values
end

p anagrams3(words)