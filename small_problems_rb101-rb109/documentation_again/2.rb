require 'date'

# Date::civil is the same as Date::new. Both are class methods which return date objects and have four optional parameters: year, month, date, and start (i.e. which calendar system to use). If any of these argument are not provided, the defaults are -4712, 1, 1, Date::JULIAN (which is the Julian calendar system). When converting a Date object to string in Ruby, trailing 0s will be added to make the month and date fields consistent in length at 2 digits.

puts Date.civil               # -4712-01-01
puts Date.civil(2016)         # 2016-01-01
puts Date.civil(2016, 5)      # 2016-05-01
puts Date.civil(2016, 5, 13)  # 2016-05-13