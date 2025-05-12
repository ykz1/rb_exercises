while true
  puts "Please enter an integer great than 0:"
  number = gets.chomp.to_i
  break if number > 0
  print "Invalid entry! "
end


while true
  puts "Enter 's' to compute the sum, 'p' to compute the product."
  operation = gets.chomp

  case operation
  when 's'
    result = 1.upto(number).sum
    puts "The sum of the integers between 1 and #{number} is #{result}"
    break
  when 'p'
    result = 1.upto(number).inject(:*)
    puts "The product of the integers between 1 and #{number} is #{result}"
    break
  else
    print "Invalid entry! "
  end

end