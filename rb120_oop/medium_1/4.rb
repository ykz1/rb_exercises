require 'pry-byebug'


=begin
Put
- Start with index 0
- Add element to index
- Increment index by 1, and go back to 0 if beyond buffer size
- If index being added to has element, first remove that element
=end

class CircularBuffer
  def initialize(size)
    @buffer = [nil] * size
    @next_put = 0
    @next_get = 0
  end

  def put(element)
    self.get if @buffer[@next_put] != nil
    @buffer[@next_put] = element
    @next_put += 1
    @next_put = 0 if @next_put >= @buffer.size
  end

  def get
    return nil if @buffer[@next_get] == nil
    element = @buffer[@next_get]
    @buffer[@next_get] = nil
    @next_get += 1
    @next_get = 0 if @next_get >= @buffer.size
    element
  end
end

buffer = CircularBuffer.new(3)
puts buffer.get == nil

buffer.put(1)
buffer.put(2)
puts buffer.get == 1

buffer.put(3)
buffer.put(4)
puts buffer.get == 2

buffer.put(5)
buffer.put(6)
buffer.put(7)
puts buffer.get == 5
puts buffer.get == 6
puts buffer.get == 7
puts buffer.get == nil

buffer = CircularBuffer.new(4)
puts buffer.get == nil

buffer.put(1)
buffer.put(2)
puts buffer.get == 1

buffer.put(3)
buffer.put(4)
puts buffer.get == 2

buffer.put(5)
buffer.put(6)
buffer.put(7)
puts buffer.get == 4
puts buffer.get == 5
puts buffer.get == 6
puts buffer.get == 7
puts buffer.get == nil

# Further exploration below. They key to this solution is that despite the buffer being circular, the mechanics by which objects are added and removed is similar to a linear buffer in that we always add to the end and remove from the beginning. 

puts

class CircularBuffer2
  def initialize(limit)
    @limit = limit
    @array = []
  end

  def put(object)
    @array.push(object)
    @array.shift if @array.size > @limit
  end

  def get
    @array.shift
  end
end

buffer = CircularBuffer2.new(3)
puts buffer.get == nil

buffer.put(1)
buffer.put(2)
puts buffer.get == 1

buffer.put(3)
buffer.put(4)
puts buffer.get == 2

buffer.put(5)
buffer.put(6)
buffer.put(7)
puts buffer.get == 5
puts buffer.get == 6
puts buffer.get == 7
puts buffer.get == nil

buffer = CircularBuffer.new(4)
puts buffer.get == nil

buffer.put(1)
buffer.put(2)
puts buffer.get == 1

buffer.put(3)
buffer.put(4)
puts buffer.get == 2

buffer.put(5)
buffer.put(6)
buffer.put(7)
puts buffer.get == 4
puts buffer.get == 5
puts buffer.get == 6
puts buffer.get == 7
puts buffer.get == nil
