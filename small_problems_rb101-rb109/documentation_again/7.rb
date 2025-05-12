s = 'abc'
puts s.public_methods.inspect

# The #public_methods method is similar to the #methods method, which returns a list of public and protected methods of the calling object, including all methods accessible in the calling object's ancestors. One parameter is accepted with a default value of true; if false is passed, then the the array of methods returned will not included methods from modules included in the calling object.

# To get just the methods of the String class:

puts s.public_methods(false).inspect

# To check that #methods actually has the same return as #public_methods:
puts
p s.methods(false).to_a - s.public_methods(false).to_a