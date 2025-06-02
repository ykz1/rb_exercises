MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY
SECONDS_PER_MINUTE = 60

# My first solution uses %'s behaviour around negatives to create a simpler solution.
def time_of_day(int)
  hour = (int / MINUTES_PER_HOUR) % HOURS_PER_DAY
  minute = (int % MINUTES_PER_HOUR)
  "#{hour.to_s.rjust(2,"0")}:#{minute.to_s.rjust(2,"0")}"
end



p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"



# The following solution matches the offical LS solution:
def time_of_day_2(int)
  minutes = normalize_minutes(int)
  format('%02d:%02d', *minutes.divmod(MINUTES_PER_HOUR))
end

def normalize_minutes(int)
  int > 0 ? int % MINUTES_PER_DAY : (int + MINUTES_PER_DAY) % MINUTES_PER_DAY
end

puts

p time_of_day_2(0) == "00:00"
p time_of_day_2(-3) == "23:57"
p time_of_day_2(35) == "00:35"
p time_of_day_2(-1437) == "00:03"
p time_of_day_2(3000) == "02:00"
p time_of_day_2(800) == "13:20"
p time_of_day_2(-4231) == "01:29"


# Further exploration 1: fefactored my initial solution to be one line:
def time_of_day_3(int)
  format('%02d:%02d', (int / MINUTES_PER_HOUR) % HOURS_PER_DAY, int % MINUTES_PER_HOUR)
end

puts

p time_of_day_3(0) == "00:00"
p time_of_day_3(-3) == "23:57"
p time_of_day_3(35) == "00:35"
p time_of_day_3(-1437) == "00:03"
p time_of_day_3(3000) == "02:00"
p time_of_day_3(800) == "13:20"
p time_of_day_3(-4231) == "01:29"

# Further exploration 2: using Date and Time classes:
def time_of_day_4(int)
  Time.new(2025, 6, 2, (int / MINUTES_PER_HOUR) % HOURS_PER_DAY, int % MINUTES_PER_HOUR, 0).strftime('%H:%M')
end

puts

p time_of_day_4(0) == "00:00"
p time_of_day_4(-3) == "23:57"
p time_of_day_4(35) == "00:35"
p time_of_day_4(-1437) == "00:03"
p time_of_day_4(3000) == "02:00"
p time_of_day_4(800) == "13:20"
p time_of_day_4(-4231) == "01:29"


# Further exploration 3: a refactor of previous solution which also allows for outputting the day of week:
def time_of_day_5(int)
  time = Time.new(2025, 6, 1, 0, 0, 0) # I am initiatlizing time at midnight of the upcoming Sunday—this effectively becomes 'time zero'
  time += int * SECONDS_PER_MINUTE # Simply add the minutes argument to our starting time
  time.strftime('%A %H:%M') # Format output to show day of week of resulting time
end

puts

p time_of_day_5(0) # == "00:00"
p time_of_day_5(-3) # == "23:57"
p time_of_day_5(35) # == "00:35"
p time_of_day_5(-1437) # == "00:03"
p time_of_day_5(3000) # == "02:00"
p time_of_day_5(800) # == "13:20"
p time_of_day_5(-4231) # == "01:29"