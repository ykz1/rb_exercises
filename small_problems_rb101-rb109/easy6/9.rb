def include?(arr, value)
  result = false
  arr.each { |element| return result = true if element == value }
  result
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false

puts

# An alternate one-line solution. The reason to return the array itself when #find fails to find our desired value is that it will never match an element of the array which would be the returned value of #find.
def include2?(arr, value)
  arr.find(proc {arr}) { | element| element == value } != arr
end

p include2?([1,2,3,4,5], 3) == true
p include2?([1,2,3,4,5], 6) == false
p include2?([], 3) == false
p include2?([nil], nil) == true
p include2?([false], false) == true
p include2?([], nil) == false
