SECONDS_PER_MINUTE = 60
MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = 24 * MINUTES_PER_HOUR
FIXED_TIME = Time.new(2025, 06, 01)

# Initial solution:

def after_midnight(str)
  hour, minute = str.split(":")
  ((hour.to_i * MINUTES_PER_HOUR) + minute.to_i) % MINUTES_PER_DAY
end

def before_midnight(str)
  (MINUTES_PER_DAY - after_midnight(str)) % MINUTES_PER_DAY
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0

# Further exploration with Time class: using the Time class doesn't actually help much here because we are given a string and asked to provide answers in integer. In our original method we are directly converting from string to integer and working in integer for our calculations. When we use Time, while it is helfpul and intuitive to use a Time object for calculations, we nevertheless have to convert to integer and remove one of the main benefits of working in Time, which is tracking days, when providing our final integer answer. Nevertheless, here is the solution with Time:

def after_midnight_2(str)
  hour, minute = str.split(":").map(&:to_i)
  time = FIXED_TIME + ((hour * MINUTES_PER_HOUR) + minute) * SECONDS_PER_MINUTE
  (((time - FIXED_TIME) / SECONDS_PER_MINUTE) % MINUTES_PER_DAY).to_i.abs
end

def before_midnight_2(str)
  hour, minute = str.split(":").map(&:to_i)
  time = FIXED_TIME - ((hour * MINUTES_PER_HOUR) + minute) * SECONDS_PER_MINUTE
  (((time - FIXED_TIME) / SECONDS_PER_MINUTE) % MINUTES_PER_DAY).to_i.abs
end

puts

p after_midnight_2('00:00') == 0
p before_midnight_2('00:00') == 0
p after_midnight_2('12:34') == 754
p before_midnight_2('12:34') == 686
p after_midnight_2('24:00') == 0
p before_midnight_2('24:00') == 0