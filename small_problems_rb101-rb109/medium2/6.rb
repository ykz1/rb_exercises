def triangle(a1, a2, a3)
  angles = [a1, a2, a3]
  return :invalid if (angles.sum != 180) || (angles.min <= 0)
  return :right if angles.include?(90)
  return :acute if angles.max < 90
  :obtuse
end 
  
  
  
p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid