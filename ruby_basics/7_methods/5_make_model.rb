def car(make, model)
  puts "#{make} #{model}"
end

car('Toyota', 'Corolla')

def car_2(make, model)
  "#{make} #{model}"
end

puts car_2('Toyota', 'Corolla')

# By removing the puts in car_2, the return value is not the string we want to print. In the original method car, the return value will be nil, which is the return value of puts
