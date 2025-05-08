def meal
  puts 'Dinner'
  return 'Breakfast'
end

puts meal

puts
puts 'Dinner'
puts 'Breakfast'
puts "Both lines are printed. 'Dinner' is printed as part of the method meal's invocation, specifically when line 2 is evaluated"
puts "And then 'Breakfast' is returned by meal, which is printed by puts in line 6"