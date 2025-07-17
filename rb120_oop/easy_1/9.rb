class Pet
  def initialize(name, age, color)
    @name = name
    @age = age
    @color = color
  end
end

class Cat < Pet
  def to_s
    %(My cat #{@name} is #{@age} years old and has #{@color} fur.)
  end
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch

# Further exploration questions:
# Why would we be able to omit the initialize method?
# A: all pets have a color, so it makes sense to include the instance variable @color in the Pet class definition. By doing so, we can omit the initialize method within our Cat class definition because through the method lookup hierarchy Pet::initialize would be called.

# Would it be a good idea to modify Pet in this way? Why or why not? 
# See above for the case for modifying Pet to initialize @color. The case against doing so is: maybe there are some pets for which color is not relevant, and so the trait would be more specific to cats and therefore should be initialized at the Cat class level.

# How might you deal with some of the problems, if any, that might arise from modifying Pet?
# A: We could set a default of 'n.a.' to the value of parameter color within our Pet::initialize definition.