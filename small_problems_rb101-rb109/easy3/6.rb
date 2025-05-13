def xor?(arg1, arg2)
  [!!arg1, !!arg2].count(true) == 1
end

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false
p xor?('abc', nil) == true
p xor?(nil, 'abc') == true
p xor?('abc', 'abc') == false
p xor?(nil, nil) == false

=begin
Further exploration questions:

One example is a game of "High Card" between two players in which the two operands are whether each player has played the highest card. If they both played the highest card, then there is no winner, but if one of them played the high card, then that person is the winner. This works with more than 2 players as well, where we look for only one high card.

xor does not perform a short-circuit evaluation, because we need to know the value of both conditions to know the evaluation of the xor operation. Therefore, the value of the second condition is important and it would not make sense to short-circuit xor.
=end