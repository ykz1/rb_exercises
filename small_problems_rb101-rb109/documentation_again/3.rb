def my_method(a, b = 2, c = 3, d)
  p [a, b, c, d]
end

my_method(4, 5, 6)

# This prints, [4, 5, 3, 6]

# When dealing with positional arguments where defaults are used, Ruby will:
# 1) first assign required parameters from left to right;
# 2) then assign required parameters from right to left;
# 3) finally, Ruby will assign optional parameters from left to right.

# In our example, 
# 1) Ruby first assigns 4 to a, which completes assignment of mandatory arguments from the left;
# 2) then assign 6 to d, which completes assignment of mandatory arguments from the right;
# 3) lastly, Ruby will assign 5 to b and uses the default value for c, which is 3.

# Note that while Ruby allows for default positional arguments in the middle of a list of parameters in a method's definition, we cannot have a mix of mandatory and optional (default) parameters in the middle of a list of parameters, such as the commented-out example below:

=begin
def my_method2(a, b = 2, c, d = 4, e)
  p [a, b, c, d, e]
end

my_method2(4, 5, 6)   # this will throw a syntax error at the '=' after d
=end
