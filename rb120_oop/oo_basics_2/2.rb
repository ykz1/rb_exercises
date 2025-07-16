class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def rename(name)
    @name = name
  end

end

kitty = Cat.new('Sophie')
p kitty.name
kitty.rename('Chloe')
p kitty.name