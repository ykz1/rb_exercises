def integer_to_string(int)
  str = ''
  int.digits.reverse.each{ |digit| str += '0'.ord.+(digit).chr }
  str
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'