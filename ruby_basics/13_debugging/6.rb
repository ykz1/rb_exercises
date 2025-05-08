def get_quote(person)
  if person == 'Yoda'
    'Do. Or do not. There is no try.'
  elsif person == 'Confucius'
    'I hear and I forget. I see and I remember. I do and I understand.'
  elsif person == 'Einstein'
    'Do not worry about your difficulties in Mathematics. I can assure you mine are still greater.'
  end
end

puts 'Confucius says:'
puts '"' + get_quote('Confucius') + '"'

=begin
The error is because each if statement in our method get_quote is evaluated sequentially, and all three are always evaluated when the method is called.
The last if statement ends up being the one that determines our method's return value, if it returns true, the intended string will be returned, but if it returns false, no expression was evaluated as a result our if statement will return nil
There are two ways to fix this:
1. Change our 3 if statements in the get_quote method to one if...elsif...else statement. This is the best solution. This has been done above.
2. If we are intent on keeping the 3 if statements, we can add an implicit return within each to stop the method and return the intended string.
=end