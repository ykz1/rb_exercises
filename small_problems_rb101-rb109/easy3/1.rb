numbers = []
['1st', '2nd', '3rd', '4th', '5th', 'last'].each_with_index do |prompt, index|
  
  while true
    puts "Enter the #{prompt} number:"
    user_input = gets.chomp
    if user_input.to_i.to_s == user_input
      numbers[index] = user_input.to_i
      break
    else
      print "Invalid entry! "
    end
  end

end

if numbers[0..4].include?(numbers[5])
  puts "The number #{numbers[5]} appears in #{numbers}"
else
  puts "The number #{numbers[5]} does not appear in #{numbers[0..4]}"
end