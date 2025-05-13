puts "==> Enter the first number:"
num1 = gets.chomp.to_f

puts "==> Enter the second number:"
num2 = gets.chomp.to_f

['+', '-', '*', '/', '%', '**'].each do |operator|
  if ['/', '%'].include?(operator) and (num2 == 0)
    result = "Error! Cannot divide by 0"
  else
    result = format('%.1f',[num1, num2].inject(operator.to_sym))
  end
  puts "==> #{num1} #{operator} #{num2} = #{result}"
end

# Code adapted to answer discussion questions:
# 1. Added workflow for catching 0 as the second number when dividing or %ing
# 2. Converted numbers to float, and formatted output to avoid scientific notation on large results