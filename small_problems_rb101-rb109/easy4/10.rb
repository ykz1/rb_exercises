def integer_to_string(int)
  str = ''
  int.digits.reverse.each{ |digit| str += '0'.ord.+(digit).chr }
  str
end

def signed_integer_to_string(int)
  str = integer_to_string(int.abs)
  case int <=> 0
  when 0 then str
  when 1 then '+' + str
  else '-' + str
  end
end
    
    

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'