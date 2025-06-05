def staggered_case(str)
  upcase_flag = false
  str.chars.map do |char|
    next char if char.match?(/[^a-zA-Z]/)
    upcase_flag = !upcase_flag
    upcase_flag ? char.upcase : char.downcase
  end.join
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

# Further exploration solution below:

def staggered_case2(str, skip_non_alphas=true)
  upcase_flag = false
  str.chars.map do |char|
    next char if (skip_non_alphas && char.match?(/[^a-zA-Z]/))
    upcase_flag = !upcase_flag
    upcase_flag ? char.upcase : char.downcase
  end.join
end

puts

p staggered_case2('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case2('ALL CAPS') == 'AlL cApS'
p staggered_case2('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

p staggered_case2('I Love Launch School!', false) == 'I LoVe lAuNcH ScHoOl!'
p staggered_case2('ALL_CAPS', false) == 'AlL_CaPs'
p staggered_case2('ignore 77 the 444 numbers', false) == 'IgNoRe 77 ThE 444 NuMbErS'