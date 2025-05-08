def count_sheep
  5.times do |sheep|
    puts sheep
  end
end

puts count_sheep

puts "The numbers 0, 1, 2, 3, 4, 5 will each be printed on a new line"
puts "When method count_sheep is called, the numbers 0, 1, 2, 3, 4 will be passed to the block given to .times. The block prints the index argument each time"
puts "Then, on line 7, not only is count_sheep called but its return value is printed by puts"
puts "The return value from count_sheep will be the return value of 5.times, which is the integer given to .times -- in this case the integer 5"