class Animal
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new
# cat1.color

p "[Cat, Animal, Object, Kernel, BasicObject]"
p cat1.class.ancestors