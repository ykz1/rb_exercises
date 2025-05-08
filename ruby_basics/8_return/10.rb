def tricky_number
  if true
    number = 1
  else
    2
  end
end

puts tricky_number

puts "1 will be printed"
puts "if true will evaluate true because the boolean true is given to the if statement"
puts "The assignment of integer 1 to the local variable number in line 3 will return the integer assigned, which is 1"
puts "The invocation of tricky_number will end on this variable assignment, and its return value will be 1, which is printed on line 9"
