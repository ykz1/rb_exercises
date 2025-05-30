def running_total(arr)
  sum = 0
  arr.map { |num| sum += num }
end

# Solution using #each_with_object
def running_total2(arr)
  sum = 0
  arr.each_with_object([]) { |num, output| output.push(sum += num) }
end


# Solution using #inject. Are there more elegant ways to use #inject to solve this?
def running_total3(arr)
  output = [ ]
  arr.size.times { |index| output << arr[0..index].inject(:+)}
  output
end

def running_total4(arr)
  output = []
  arr.inject(0) { |accumulator, element| output << (accumulator + element)}
  output
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

puts

p running_total2([2, 5, 13]) == [2, 7, 20]
p running_total2([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total2([3]) == [3]
p running_total2([]) == []

puts

p running_total3([2, 5, 13]) == [2, 7, 20]
p running_total3([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total3([3]) == [3]
p running_total3([]) == []

puts

p running_total4([2, 5, 13]) == [2, 7, 20]
p running_total4([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total4([3]) == [3]
p running_total4([]) == []