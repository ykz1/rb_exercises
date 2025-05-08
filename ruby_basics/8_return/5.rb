def meal
  'Dinner'
  puts 'Dinner'
end

p meal

puts
puts "Dinner"
puts "nil"
puts "'Dinner' will be printed as part of method meal's invocation, when line 3 is executed"
puts "The return value of method meal will be nil, because that is the return value of puts, which is the last line evaluated"
puts "Whereas puts prints the string evaluation of the argument provided, p will return the object, but either way 'nil' will be printed"