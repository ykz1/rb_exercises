# Solution to base exercises:
def triangle(lines)
  (1..lines).each { |line| puts ("*" * line).rjust(lines) }
end

triangle(5)
triangle(9)

# Further exploration:
def triangle2(lines, corner = 4)
  unless (lines.is_a? Integer) && (lines > 0)
    puts "Invalid output! Enter a positive integer for number of lines"
    return
  end
  case corner
  when 1
    lines.downto(1).each { |line| puts ("*" * line).rjust(lines) }
  when 2
    lines.downto(1).each { |line| puts ("*" * line).ljust(lines) }
  when 3
    1.upto(lines).each { |line| puts ("*" * line).ljust(lines) }
  when 4
    1.upto(lines).each { |line| puts ("*" * line).rjust(lines) }
  else
    puts "Pick a valid quadrant as the corner, between 1 ~ 4"
  end
end

triangle2(5, 4)
triangle2(5, 3)
triangle2(5, 2)
triangle2(5, 1)
triangle2(8)
triangle2('hello')