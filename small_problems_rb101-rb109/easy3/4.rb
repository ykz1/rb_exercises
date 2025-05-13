def multiply(num1, num2)
  num1 * num2
end

p multiply(5, 3) == 15

p multiply(['hello', 5],2) == ['hello', 5, 'hello', 5]  # When called on an array, * will make copies of the elements of the calling array