def get_grade(grade1, grade2, grade3)
  average = (grade1 + grade2 + grade3) / 3.0
  return 'A+' if average > 100  # Added for further exploration question
  case average
    when 90..100 then 'A'
    when 80...90 then 'B'
    when 70...80 then 'C'
    when 60...70 then 'D'
    else 'F'
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"