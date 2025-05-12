# Capture upper and lower bounds and store into variables. This allows for flexibility to test different ranges.
start_number = 1
end_number = 99

# Find the first even number that falls within the range.
(start_number.even?) ? (number = start_number) : (number = start_number + 1)

# Loop through and print all even numbers within range.
while number <= end_number
  puts number
  number += 2
end
