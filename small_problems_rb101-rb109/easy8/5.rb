def fizzbuzz(num1, num2)
  result = (num1..num2).map do |num| 
    case
      when num % 15 == 0 then 'FizzBuzz' 
      when num % 5 == 0 then 'Buzz' 
      when num % 3 == 0 then 'Fizz' 
      else num
    end
  end

  puts result.join(', ')

end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz