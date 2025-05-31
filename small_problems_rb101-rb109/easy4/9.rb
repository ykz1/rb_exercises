def integer_to_string(int)
  str = ''
  int.digits.reverse.each{ |digit| str += '0'.ord.+(digit).chr }
  str
end

def integer_to_string2(int)
  int.digits.reverse.map { |digit| '0'.ord.+(digit).chr }.join
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'

puts


p integer_to_string2(4321) == '4321'
p integer_to_string2(0) == '0'
p integer_to_string2(5000) == '5000'