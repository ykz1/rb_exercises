def oddities(arr)
  arr.select.with_index { |_, idx| idx % 2 == 0 }
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
p oddities([1, 2, 3, 4, 1]) == [1, 3, 1]

# Further exploration below returning even index elements of an array, using a different set of methods.
def eveners(arr)
  arr.each_with_index.with_object([]) { |(element, idx), output| (output << element) if (idx % 2 != 0) }
end

p eveners([2, 3, 4, 5, 6]) 
p eveners([1, 2, 3, 4, 5, 6]) 
p eveners(['abc', 'def']) 
p eveners([123]) 
p eveners([]) 
p eveners([1, 2, 3, 4, 1]) 

# Alternate using simpler loop:
def oddities2(arr)
  output = []
  index = 0
  while index < arr.size
    output << arr[index]
    index += 2
  end
  output
end

p oddities2([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities2([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities2(['abc', 'def']) == ['abc']
p oddities2([123]) == [123]
p oddities2([]) == []
p oddities2([1, 2, 3, 4, 1]) == [1, 3, 1]
