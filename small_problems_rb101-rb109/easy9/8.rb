def buy_fruit(arr)
  arr.map.with_object([]) { |(fruit, count), output| count.times { output << fruit } }
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

def buy_fruit2(arr)
  arr.map { |fruit, count| [fruit] * count }.flatten
end

p buy_fruit2([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
