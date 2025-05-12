def generate_age
  rand(20..200)
end

puts "Teddy is #{generate_age} years old!"

# Further exploration below:

def output_age(name = 'Teddy')
  puts "#{name} is #{generate_age} years old!"
end

puts "Enter a name: "
name = gets.chomp

# Code below doesn't work because passing nil to output_age would not effect the default value to be used
# output_age(name.empty? ? nil : name)

if name == ''
  output_age
else
  output_age(name)
end