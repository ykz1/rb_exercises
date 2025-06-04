# Main solution below. Note that I am using #times instead of #each so as to iterate fewer times by adding to element in our output array per iteration. Does this make this a more efficient solution than using #each?
def reverse(arr)
  arr2 = arr.clone
  (arr.size / 2).times { |i| arr2[i], arr2[-(1 + i)] = arr[-(1 + i)], arr[i] }
  arr2
end

p reverse([1, 2, 3, 4]) == [4, 3, 2, 1]         # => true
p reverse([1, 2, 3, 4, 1]) == [1, 4, 3, 2, 1]   # => true
p reverse(%w(a b e d c)) == %w(c d e b a)       # => true
p reverse(['abc']) == ['abc']                   # => true
p reverse([]) == []                             # => true

list = [1, 3, 2]                                # => [1, 3, 2]
new_list = reverse(list)                        # => [2, 3, 1]
p list.object_id != new_list.object_id          # => true
p list == [1, 3, 2]                             # => true
p new_list == [2, 3, 1]                         # => true

puts

# Further exploration solution below using each_with_object:
def reverse_2(arr)
  arr.each_with_object([]) { |element, output| output.unshift(element) }
end
p reverse_2([1, 2, 3, 4]) == [4, 3, 2, 1]         # => true
p reverse_2([1, 2, 3, 4, 1]) == [1, 4, 3, 2, 1]   # => true
p reverse_2(%w(a b e d c)) == %w(c d e b a)       # => true
p reverse_2(['abc']) == ['abc']                   # => true
p reverse_2([]) == []                             # => true

list = [1, 3, 2]                                # => [1, 3, 2]
new_list = reverse_2(list)                        # => [2, 3, 1]
p list.object_id != new_list.object_id          # => true
p list == [1, 3, 2]                             # => true
p new_list == [2, 3, 1]                         # => true

puts

# Further exploration solution below using inject:
def reverse_3(arr)
  arr.inject([], :unshift)
end
p reverse_3([1, 2, 3, 4]) == [4, 3, 2, 1]         # => true
p reverse_3([1, 2, 3, 4, 1]) == [1, 4, 3, 2, 1]   # => true
p reverse_3(%w(a b e d c)) == %w(c d e b a)       # => true
p reverse_3(['abc']) == ['abc']                   # => true
p reverse_3([]) == []                             # => true

list = [1, 3, 2]                                # => [1, 3, 2]
new_list = reverse_3(list)                        # => [2, 3, 1]
p list.object_id != new_list.object_id          # => true
p list == [1, 3, 2]                             # => true
p new_list == [2, 3, 1]                         # => true
