print "What is the bill? "
bill_amount = gets.chomp.to_f.round(2)

print "What is the tip percentage "
tip_percent = gets.chomp.to_f / 100

tip_amount = (bill_amount * tip_percent).round(2)
bill_total = bill_amount + tip_amount

puts "The tip is #{format('$%.2f', tip_amount)}"
puts "The total is #{format('$%.2f', bill_total)}"

