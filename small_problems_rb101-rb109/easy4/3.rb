def leap_year?(year)
  if year % 4 == 0
    return true unless year % 100 == 0
    return false unless year % 400 == 0
    true
  else
    false
  end
end

# One-line solution below
def leap_year2?(year)
  (year % 400 == 0) || (year % 4 == 0) && (year % 100 != 0)
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true

puts

p leap_year2?(2016) == true
p leap_year2?(2015) == false
p leap_year2?(2100) == false
p leap_year2?(2400) == true
p leap_year2?(240000) == true
p leap_year2?(240001) == false
p leap_year2?(2000) == true
p leap_year2?(1900) == false
p leap_year2?(1752) == true
p leap_year2?(1700) == false
p leap_year2?(1) == false
p leap_year2?(100) == false
p leap_year2?(400) == true