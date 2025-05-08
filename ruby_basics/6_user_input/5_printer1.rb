
loop do
  puts "How many output lines do you want? Enter a number that is 3 or greater"
  n = gets.chomp.to_i

  if n >= 3
    n.times {puts "Launch School is the best!" }
    break
  else
    puts "That's not enough lines."
  end
end