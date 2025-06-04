DEGREE = "\u00B0"
SECONDS_PER_MINUTE = 60
MINUTES_PER_DEGREE = 60
SECONDS_PER_DEGREE = SECONDS_PER_MINUTE * MINUTES_PER_DEGREE
DEGREES_IN_TURN = 360

def dms(flo)
  degrees = flo.to_i
  format_digits = Proc.new { |num| sprintf('%02d',num) }

  minutes, seconds = ((flo - degrees).round(4) * SECONDS_PER_DEGREE).divmod(SECONDS_PER_MINUTE).map(&format_digits)

  degrees = convert_to_360_degrees(degrees)

  "#{degrees}#{DEGREE}#{minutes}'#{seconds}\""
end

# Method for further exploration question:
def convert_to_360_degrees(int)
  int % DEGREES_IN_TURN
end

# All test cases should return true
puts dms(30) #== %(30°00'00")
puts dms(76.73) #== %(76°43'48")
puts dms(254.6) #== %(254°36'00")
puts dms(93.034773) #== %(93°02'05")
puts dms(0) #== %(0°00'00")
puts dms(360) #== %(360°00'00") || dms(360) #== %(0°00'00")

# Further exploration test cases below
puts dms(400) != %(400°00'00")
puts dms(-40) != %(-40°00'00")
puts dms(-420) != %(-420°00'00")

puts dms(400) == %(40°00'00")
puts dms(-40) == %(320°00'00")
puts dms(-420) == %(300°00'00")