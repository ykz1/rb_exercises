# Here is the solution from our last exercise
def leap_year_greg?(year)
  (year % 400 == 0) || (year % 4 == 0) && (year % 100 != 0)
end

# Here is an implementation of the method which uses our previous method under the Gregorian calendar
def leap_year?(year)
  year > 1752 ? leap_year_greg?(year) : year % 4 == 0
end

# One-line solution, though not the easiest to read
def leap_year3?(year)
  (year < 1752 && year % 4 == 0) || (year % 400 == 0) || (year % 4 == 0) && (year % 100 != 0)
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
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true

puts

# Added test cases for one-line solution
p leap_year3?(2016) == true
p leap_year3?(2015) == false
p leap_year3?(2100) == false
p leap_year3?(2400) == true
p leap_year3?(240000) == true
p leap_year3?(240001) == false
p leap_year3?(2000) == true
p leap_year3?(1900) == false
p leap_year3?(1752) == true
p leap_year3?(1700) == true
p leap_year3?(1) == false
p leap_year3?(100) == true
p leap_year3?(400) == true