SQFT_PER_SQM = 10.7639
SQIN_PER_SQFT = 144
SQCM_PER_SQFT = 1 / SQFT_PER_SQM * 10000

puts "Enter the length of the room in meters:"
length_m = gets.chomp.to_f

puts "Enter the width of the room in meters:"
width_m = gets.chomp.to_f

area_sqm = length_m * width_m
area_sqft = area_sqm * SQFT_PER_SQM

puts "The area of the room is #{area_sqm.round(2)} square meters (#{area_sqft.round(2)} square feet)."

# Further exploration below:
puts "Enter the length of the room in feet:"
length_ft = gets.chomp.to_f

puts "Enter the width of the room in feet:"
width_ft = gets.chomp.to_f

area_sqft = length_ft * width_ft
area_sqin = area_sqft * SQIN_PER_SQFT
area_sqcm = area_sqft * SQCM_PER_SQFT

puts "The area of the room is #{area_sqft.round(2)} square feet, #{area_sqin.round(2)} square inches, and #{area_sqcm.round(2)} square centimeters."
