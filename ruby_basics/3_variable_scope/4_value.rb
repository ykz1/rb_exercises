a = "Xyzzy"

def my_value(b)
  b[2] = '-'
end

my_value(a)
puts a

puts "will print 'Xy-zy', because while integers are immutable, strings are mutable."
puts "line 4 did not point variable a to a different string, but instead mutated the string object / memory space that variable a points to"
puts "specifically, line 4 changed the 3rd character (index 2) in the string object that a points to from 'z' to '-'"