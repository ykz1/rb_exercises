stoplight = ['green', 'yellow', 'red'].sample

case stoplight
when 'green' then puts "Go!"
when 'yellow'; puts "Slow down!"
else puts "Stop!"                 # interestingly, the else statement does not need then / , / \n
end