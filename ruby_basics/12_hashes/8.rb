numbers = {
  high:   100,
  medium: 50,
  low:    10
}

low_numbers = numbers.select! do |key, value|
                 value < 25
               end

p low_numbers
p numbers

# We don't need the new hash low_numbers because we've mutated numbers with .select! and therefore can simply use numbers since it is the same as low_numbers


