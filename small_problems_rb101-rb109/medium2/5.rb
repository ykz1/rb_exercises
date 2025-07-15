=begin

Requirements:
- Input:      3 numbers, could be float
- Output:     one of 4 symbols
- Operation:  
  1) check for validity of triangle
  2) check for type of triangle

Solution overview:
- Things to test for:
  - Any sides equal to or lesser than 0? Return :invalid if so
  - All 3 sides equal? :equilateral
  - Longest side less than sum of other 3? :invalid if so
  - All 3 sides different? 
  - 
  - Sort the lengths in an array
- Check for any lesser or equal to 0, return :invalid if so
- 3rd element less than sum of first 2? invalid if not
- uniq elements is 1 --> :equilateral
- uniq elements is 2 --> :isosceles
- otherwise --> scalene

=end

def triangle(side1, side2, side3)
  sides = [side1, side2, side3].sort
  return :invalid if sides.min <= 0
  return :invalid if sides[2] >= (sides[0] + sides[1])
  return :equilateral if sides.uniq.count == 1
  return :isosceles if sides.uniq.count == 2
  :scalene
end

p triangle(3, 3, 3) #== :equilateral
p triangle(3, 3, 1.5) #== :isosceles
p triangle(3, 4, 5) #== :scalene
p triangle(0, 3, 3) #== :invalid
p triangle(3, 1, 1) #== :invalid