numbers = []
index = 0

while index < 5
  numbers[index] = rand(0..99)
  p numbers[index]
  index += 1
end

# looking at solution...more efficient would be to not use an index and simply use numbers.size or numbers.length plus push or <<
