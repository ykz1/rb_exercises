def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

inputs = []

loop do
  input = nil
  while inputs.size < 2 do
    puts "Please enter a positive or negative integer:"
    loop do
      input = gets.chomp
      break if valid_number?(input)
      puts "Invalid input. Only non-zero integers are allowed."
    end
    inputs << input.to_i
  end

  break if inputs.max > 0 && inputs.min < 0

  puts "Sorry. One integer must be positive, one must be negative."

end

puts "#{inputs[0]} + #{inputs[1]} = #{inputs.sum}"