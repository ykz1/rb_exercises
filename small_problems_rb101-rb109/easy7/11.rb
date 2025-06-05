def count_occurrences(arr)
  arr.uniq.each { |element| puts "#{element} => #{arr.count(element)}" }
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)

# Further exploration solution below:
def count_occurrences2(arr)
  arr = arr.map(&:downcase)
  arr.uniq.each { |element| puts "#{element} => #{arr.count(element)}" }
end

vehicles2 = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'suv', 'motorcycle', 'motorcycle', 'car', 'truck'
]
puts

count_occurrences2(vehicles2)

# Note that our array remains unchanged by our method:
p vehicles2