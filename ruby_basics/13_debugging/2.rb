def predict_weather
  sunshine = [true, false].sample

  if sunshine
    puts "Today's weather will be sunny!"
  else
    puts "Today's weather will be cloudy!"
  end
end

predict_weather

=begin
The error with the original is logical rather than syntactic: the method will always print "Today's weather will be sunny!".
The reason is that sunshine will always evaluate true in line 4's if statement, because all strings (and in fact everything other than false and nil) are truthy in Ruby.
The core issue is that sunshine is an array of two strings which both are truthy, when the intention is for sunshine to be array of two boolean elements: true and false.
Revised code above.
=end