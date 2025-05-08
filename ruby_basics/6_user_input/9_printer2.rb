loop do
  input = nil
  
  loop do
    puts '>> How many output lines do you want? Enter a number >= 3 (Q to quit)'
    input = gets.chomp
    break if input.downcase == "q"
    input = input.to_i
    break if input >= 3
    puts ">> That's not enough lines."
  end
  
  break if input.downcase == "q"

  while input > 0
    puts 'Launch School is the best!'
    input -= 1
  end

end