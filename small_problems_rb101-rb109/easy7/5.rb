def staggered_case(str)
  upcase_flag = false
  str.chars.map do |char|
    upcase_flag = !upcase_flag
    upcase_flag ? char.upcase : char.downcase
  end.join
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

# Further exploration solution below:

def staggered_case2(str, start_with_capital=true)
  upcase_flag = !start_with_capital
  str.chars.map do |char|
    upcase_flag = !upcase_flag
    upcase_flag ? char.upcase : char.downcase
  end.join
end

p staggered_case2('I Love Launch School!') 
p staggered_case2('I Love Launch School!', false)

p staggered_case2('ALL_CAPS')
p staggered_case2('ALL_CAPS',false)

p staggered_case2('ignore 77 the 444 numbers')
p staggered_case2('ignore 77 the 444 numbers', false)