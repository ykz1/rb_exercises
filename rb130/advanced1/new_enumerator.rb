# Create new Enumerator object
# Iterate over an infinite list of factorials
# Print out the first 7 factorial values, starting with 0!
# Use an external iterator
# Print first 7, then print 3 more, then use #rewind, then print 7 more

enum = Enumerator.new do |y|
  a = b = 1
  n = 2
  loop do
    y << a
    a, b = b, b * n
    n += 1
  end
end

7.times { |num| puts "#{num}! == #{enum.next}"}
puts
3.times { |num| puts "#{num}! == #{enum.next}"}
enum.rewind
puts
7.times { |num| puts "#{num}! == #{enum.next}"}

puts
enum.each_with_index do |value, index|
  puts "#{index}! == #{value}"
  break if index >= 5
end