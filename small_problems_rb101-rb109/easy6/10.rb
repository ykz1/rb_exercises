array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

# Answer below:
=begin
This question demonstrates Ruby's pass-by-reference characteristics.

First, we initialize two separate array objects.

Then, we iterate through the first array, and one by one, each element is added into array 2. At this point, the two arrays are different objects, but their elements each respectively references the same underlying string object.

Then, we iterate through the first array again, and mutate the elements which start with 'C' or 'S' by capitalizing the string objects referenced. This mutates matching elements in our first array, but since our second array's elements reference the same underlying string objects as our first array's elements, the values in our second array are changed as well.

Finally, when the second array is passed as an argument to `puts`'s invocation on line 5, the following will be printed to the screen:
['Moe', 'Larry', 'CURLY', 'SHEMP', 'Harpo', 'CHICO', 'Groucho', 'Zeppo']
=end

# Further exploration answer: 
=begin
When two different arrays have common objects as elements, we can get in trouble when we mutate elements in one array expecting our second array to remain unchanged. This is especially insidious because it is not clear whether elements in two arrays reference the same or different underlying objects. 

One way we might try to address this is to make `array2` a copy of `array1` with `#dup` or `#clone`, but both of these methods actually only make shallow copies, meaning that while the cloned array will be a new array object, its elements will actually reference the same objects as our original array's elements. Ruby does not have a straightforward way of making deep copies.

Instead, we need to make clones of the individual elements from our first array when we add them to our second array. See code below:
=end

puts

arr1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
arr2 = []
arr1.each { |value| arr2 << value.clone }
arr1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts arr1
puts
puts arr2
