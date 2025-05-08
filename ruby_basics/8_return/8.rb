def count_sheep
  5.times do |sheep|
    puts sheep
  end
  10
end

puts count_sheep

puts
puts "The numbers 0, 1, 2, 3, 4, 10 will be printed, each on a new line"
puts "0, 1, 2, 3, 4 are printed with the invocation of 5.times within count_sheep"
puts "10 is printed as the return value from the invocation of count_sheep"