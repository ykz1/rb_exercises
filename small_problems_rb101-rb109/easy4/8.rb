# Basic one-method solution to exercise:
def string_to_signed_integer(str)
  str = str.chars
  if %w(+ -).include?(str[0])
    negative_flag = true if str[0] == '-'
    str.shift
  end
  int = 0
  str.reverse.each_with_index { |char, power| int += ('1'..char).count * 10**power }
  negative_flag ? int * -1 : int
end

# Refactored solution with two methods, reusing our original string-to-integer solution and incorporating further exploration considerations:
def string_to_signed_integer_2(str)
  abs_str = %w(+ -).include?(str[0]) ? str[1..-1] : str
  str[0] == '-' ? -str_to_int(abs_str) : str_to_int(abs_str)
end

def str_to_int(str)
  int = 0
  str.chars.reverse.each_with_index { |char, power| int += ('1'..char).count * 10**power }
  int
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100

puts


p string_to_signed_integer_2('4321') == 4321
p string_to_signed_integer_2('-570') == -570
p string_to_signed_integer_2('+100') == 100