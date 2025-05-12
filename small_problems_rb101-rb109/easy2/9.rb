name = 'Bob'
save_name = name
name = 'Alice'
puts name, save_name

=begin
What happens in code above:
Line 1: the variable 'name' is initialized and assigned the value 'Bob'
Line 2: the variable 'save_name' is initialized and assigned to point at the same object that 'name' points at, which is a string object with value 'Bob'
Line 3: the variable 'name' is re-assigned to point at a different string object with value 'Alice'
Line 4: name and save_name point to different string objects 'Bob' and 'Alice', respectively. These two values are printed
=end

name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

=begin
What happens in code above:
Line 14: the variable 'name' is initialized and assigned the value 'Bob'
Line 15: the variable 'save_name' is initialized and assigned to point at the same object that 
Line 16: the mutating method upcase!() is called on variable `name`, which mutates the underlying string object from 'Bob' to 'BOB'. Both variables save_name and name still point to this object, and as a result...
Line 17: both name and save_name will print as "BOB" when printed
=end