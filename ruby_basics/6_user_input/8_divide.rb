def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

puts "Enter numerator:"
numerator = gets.chomp

loop do
  break if valid_number?(numerator)
  puts "Invalid input. Only integers are allowed."
  numerator = gets.chomp
end

puts "Enter denominator:"
denominator = gets.chomp

loop do
  if valid_number?(denominator)
    if denominator.to_i != 0
      break
    else
      puts "Invalid input. You can't divide by 0"
    end
  else
    puts "Invalid input. Only integers are allowed."
  end
  denominator = gets.chomp
end

quotient = numerator.to_i / denominator.to_i
puts "#{numerator} / #{denominator} is #{quotient}"