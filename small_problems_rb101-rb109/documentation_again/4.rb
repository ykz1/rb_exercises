a = [1, 4, 8, 11, 15, 19]

# Array#bsearch returns an element from the calling array as determined by binary search using the block given. Found in: https://docs.ruby-lang.org/en/3.2/bsearch_rdoc.html

# To find the first element whose value exceeds 8:
p a.bsearch { |x| x > 8 }    # Returns 11


# Other notes re: #bsearch:

p a.bsearch   # Should return an enumerator object
p a.bsearch { |x| x >= 10 }    # Returns 11 as well because it is the first element greater than 5