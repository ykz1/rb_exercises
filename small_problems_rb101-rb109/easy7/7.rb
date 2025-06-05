def show_multiplicative_average(array)
  format('The result is %.3f', (array.inject(:*).to_f / array.size))
end

p show_multiplicative_average([3, 5])                # => The result is 7.500
p show_multiplicative_average([6])                   # => The result is 6.000
p show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667

# Further exploration: if we omit the #to_f, then an integer division will be performed, effectively rounding down our output to the nearest whole number.