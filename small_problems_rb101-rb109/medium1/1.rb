def rotate_array(arr)
  output = arr.clone
  output << output.shift
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true

# Alternate solution below using slicing:
def rotate_array2(arr)
  arr[1..-1] + [arr[0]]
end

p rotate_array2([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array2(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array2(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array2(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true

# Further exploration:
def rotate_string(str)
  rotate_array2(str.chars).join
end

p rotate_string('12345') == '23451'