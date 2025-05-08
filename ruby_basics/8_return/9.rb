def count_sheep
  5.times do |sheep|
    puts sheep
    if sheep >= 2
      return
    end
  end
end

p count_sheep

puts
puts "0, 1, 2, nil will be printed, each on a new line"
puts "0, 1, 2 will be printed as part of 5.times' invocation. The iterator stops when sheep reaches 2 because of the if statement on line 4"
puts "Finally, nil is printed as the return value of count_sheep, because it is the return value of 5.times. return will return nil when not supplied an argument, which is what happens on line 5"
