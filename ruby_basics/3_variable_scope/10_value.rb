a = 7
array = [1, 2, 3]

def my_value(ary)
  ary.each do |b|
    a += b
  end
end

my_value(array)
puts a

puts "This will raise an error because the variable a referenced in line 6 has not been defined"
puts "variable a referenced in line a is different than the outer scope variable a defined in line 1"
puts "specifically, += is the same as a = a + b, and it is the second a in that line which causes this error"