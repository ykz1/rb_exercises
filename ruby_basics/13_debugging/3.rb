def multiply_by_five(n)
  n * 5
end

puts "Hello! Which number would you like to multiply by 5?"
number = gets.chomp.to_i

puts "The result is #{multiply_by_five(number)}!"

=begin
The issue is around variable type. One line 6, the user's input is saved to the variable 'number' as a string.
When we pass a string to our method and multiple that string by 5 in line 2, ruby repeats the string '10' 5 times.
Fixed in line 6 by storing the user's input as an integer.
=end