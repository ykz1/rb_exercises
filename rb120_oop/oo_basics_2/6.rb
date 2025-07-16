class Cat
  attr_accessor :name
  COLOR = 'purple'

  def initialize(name)
    @name = name
  end

  def color
    COLOR
  end

  def greet
    puts "Hello! My name is #{name} and I'm a #{color} cat"
  end

end


kitty = Cat.new('Sophie')
kitty.greet