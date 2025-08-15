def step(start, stop, step)
  value = start
  output = []
  until value > stop
    output << value
    yield(value) if block_given?
    value += step
  end
  output # Return the array created because there are reasonable use cases for step to create such an array on top of just stepping through and executing the incremental values
end

p step(1, 10, 3) { |value| puts "value = #{value}" }