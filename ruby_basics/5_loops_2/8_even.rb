number = 0

until number == 10
  number += 1
  next unless number.even?
  puts number
end

