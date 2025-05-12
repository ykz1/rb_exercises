# Option 1 with step(). The benefit is that we enumerate only the numbers we want to print:
(1..99).step(2) { |number| puts number }

puts

# Option 2 and 3 below iterate through all numbers from 1 to 99 and prints them if odd:
(1..99).to_a.each { |number| puts number if number.odd? }
puts
1.upto(99) { |number| puts number if number.odd? }
puts
(1..99).select { |number| puts number if number.odd? }