def any?(arr)
  index = 0
  until index == arr.size
    return true if yield(arr[index])
    index += 1
  end
  false
end

p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false

def any2?(collection)
  collection.each { |element| return true if yield(element) }
  false
end

p any2?([1, 3, 5, 6]) { |value| value.even? } == true
p any2?([1, 3, 5, 7]) { |value| value.even? } == false
p any2?([2, 4, 6, 8]) { |value| value.odd? } == false
p any2?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any2?([1, 3, 5, 7]) { |value| true } == true
p any2?([1, 3, 5, 7]) { |value| false } == false
p any2?([]) { |value| true } == false
