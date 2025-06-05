# Two solutions below: the first one uses #each_with_index but is not the most efficient because I don't actually use the elements being iterated through. I can use the element, but it feels more consistent to add elements from both input arrays using indices rather than using the iterating element from the first array and a lookup-by-index for the second. The second solution uses #inject with an initial object which is then used to store our output. The second solution feels more elegant and efficient.

def interleave(arr1, arr2)
  output = []
  arr1.each_with_index { |_, i| output.push(arr1[i], arr2[i]) }
  output
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

def interleave2(arr1, arr2)
  (0..(arr1.size - 1)).inject([]) { |output, i| output.push(arr1[i], arr2[i]) }
end

p interleave2([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

# Further exploration answer below. #zip combines elements from argument array(s) with elements from the calling array at the same indices into arrays elements of the returning array—this is exactly what we want except we don't want elements of our returning array to be in nested arrays and so we call #flatten to remove nested arrays and just get the elements into our final output array.
def interleave3(arr1, arr2)
  arr1.zip(arr2).flatten
end

puts
p interleave3([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
