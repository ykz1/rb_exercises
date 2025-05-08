def digit_product(str_num)
  digits = str_num.chars.map { |n| n.to_i }
  product = 0

  digits.each do |digit|
    product *= digit
  end

  product
end


p digit_product('12345')
# expected return value: 120
# actual return value: 0

# The problem comes from a combination of line 3 an line 6. Because we initiate our variable product with value 0, each time we multiply a digit in line 6, the result is 0 because x * 0 == 0. 
# To fix this, we can initiate product with value 1 in line 3: `product = 1`
