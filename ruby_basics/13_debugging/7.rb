# Financially, you started the year with a clean slate.

balance = 0

# Here's what you earned and spent during the first three months.

january = {
  income: [ 1200, 75 ],
  expenses: [ 650, 140, 33.2, 100, 26.9, 78 ]
}

february = {
  income: [ 1200 ],
  expenses: [ 650, 140, 320, 46.7, 122.5 ]
}

march = {
  income: [ 1200, 10, 75 ],
  expenses: [ 650, 140, 350, 12, 59.9, 2.5 ]
}

# Let's see how much you've got now...

def calculate_balance(month)
  plus  = month[:income].sum
  minus = month[:expenses].sum

  plus - minus
end

[january, february, march].each do |month|
  balance += calculate_balance(month)
end

puts balance

# The error is in line 32, where the value stored in variable balance is being overwritten with each iteration. This ultimately means that the final month's calculation is being saved to the balance -- i.e. March. We can see below that this is indeed the case
puts calculate_balance(march)

# To fix, simply change line 32's assignment `=` to an addition assignment operator `+=`. This is done above and balance should calculate correctly now.

# Note that there is a floating point error impacting the precision of our calculated result. One quick way to address this is to round our result. See below:

puts calculate_balance(march).round(2)