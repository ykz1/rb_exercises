# Method steps:
# 1. validate inputs as strings
# 2. compare string lengths
# 3. create and return output string


def short_long_short(str1, str2)
  return "Error! Input two strings" unless (str1.is_a?(String) && str2.is_a?(String))
  if str1.size > str2.size
    str2 + str1 + str2
  elsif str1.size < str2.size
    str1 + str2 + str1
  else
    "Both strings are the same size!"
  end
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"

# Added a couple of test cases below:
p short_long_short('123', 123)
p short_long_short('123', '123')