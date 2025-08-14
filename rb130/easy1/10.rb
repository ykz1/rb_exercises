def count(collection)
  counter = 0
  collection.each { |element| counter += 1 if yield(element) }
  counter
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2


def count2(collection)
  collection.map{ |element| yield(element) ? 1 : 0 }.sum
end


p count2([1,2,3,4,5]) { |value| value.odd? } == 3
p count2([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count2([1,2,3,4,5]) { |value| true } == 5
p count2([1,2,3,4,5]) { |value| false } == 0
p count2([]) { |value| value.even? } == 0
p count2(%w(Four score and seven)) { |value| value.size == 5 } == 2
