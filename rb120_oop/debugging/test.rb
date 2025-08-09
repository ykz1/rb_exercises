class Value
  attr_reader :value
  def initialize(arg)
    @value = arg
  end
  def value=(arg)
    @value = arg.upcase!
  end
end

a = Value.new('hello')
p a.value = 'hi'