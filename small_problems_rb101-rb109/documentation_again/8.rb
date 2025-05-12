a = [5, 9, 3, 11]
puts a.min

# We see that Array actually doesn't have the #min method, but the included module Enumerables does: https://docs.ruby-lang.org/en/2.3.0/Enumerable.html#method-i-min

# One implementation of #min allows for an integer argument, which can specify how many minimum elements are returned in an assorted array.

# To get the smallest two numbers:

puts a.min(2)