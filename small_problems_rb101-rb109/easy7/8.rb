def multiply_list(arr1, arr2)
  (0..(arr1.size - 1)).inject([]) { |output, i| output << (arr1[i] * arr2[i]) }
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

# Further exploration solution below with #zip:
def multiply_list2(arr1, arr2)
  arr1.zip(arr2).map { |pair| pair.inject(:*) }
end

p multiply_list2([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
