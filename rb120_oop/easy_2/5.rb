class Something
  def initialize
    @data = 'Hello'
  end

  def dupdata
    @data + @data
  end

  def self.dupdata
    'ByeBye'
  end
end

thing = Something.new

puts "Expected: ByeBye"
puts Something.dupdata

puts "Expected: HelloHello"
puts thing.dupdata