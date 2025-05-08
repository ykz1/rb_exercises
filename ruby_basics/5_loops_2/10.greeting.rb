def greeting
  puts 'Hello!'
end

number_of_greetings = 2
idx = 1

while idx <= number_of_greetings
  greeting
  idx += 1
end