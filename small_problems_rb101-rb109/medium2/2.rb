require 'pry-byebug'
=begin

Start:  11:22a
Finish: 11:45a

Requirement:
- Input:      a collection of spelling blocks with two letters per block, string argument
- Output:     true / false
- Operation:  can the string given be produced using only one letter from each block?

Solution overview:
- process the block given and save into an array of sub-arrays each containing two one-character strings
- iterate through each unique character of given string
- find sub-array containing that character, and check whether the other character from the sub-array can be found in the string; return false if found
- if finished iterating then return true

Assumptions:
- ignore case sensitivity
- each letter can only be used once, which means if there are any duplicates in string provided, return false

=end
BLOCKS = "B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M"

def block_word?(str)
  str = str.downcase
  chars = str.chars
  return false if chars.uniq != chars

  block_pairs = {}
  BLOCKS.downcase.split.each do |block|
    block_pairs[block[0]] = block[-1]
    block_pairs[block[-1]] = block[0]
  end

  chars.each do |char|
    return false if str.include?(block_pairs[char])
  end
  true
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
p block_word?('apples') == false
p block_word?('Baby') == false

def block_word2?(str)
  blocks = %w(BO XK DQ CP NA GT RE FS JW HUI LY ZM)
  blocks.all? { |block| str.downcase.count(block.downcase) <= 1 }
end

puts
p block_word2?('BATCH') == true
p block_word2?('BUTCH') == false
p block_word2?('jest') == true
p block_word2?('apples') == false
p block_word2?('Baby') == false
