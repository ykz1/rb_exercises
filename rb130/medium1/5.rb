items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end


gather(items) do |*first_few, last|
  puts first_few.join(', ')
  puts last
end

puts

gather(items) do |first, *middle_few, last |
  puts first
  puts middle_few.join(', ')
  puts last
end

puts

gather(items) do |first , *remaining|
  puts first
  puts remaining.join(', ')
end

puts

gather(items) do |first, second, third, fourth|
  puts "#{first}, #{second}, #{third}, and #{fourth}"
end