5.step(to: 10, by: 3) { |value| puts value }

# Numeric#step has many ways to be implemented. In the example given, we are passing three arguments: "to:", "by:", and a block. The interpretation here is: starting with 5, count up in increments of 3 until we reach 10, and for each number counted, print that value. The output will be 5 and 8 each on a new line.