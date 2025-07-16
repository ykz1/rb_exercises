class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  # old method
  # def to_s
  #   @name.upcase!
  #   "My name is #{@name}."
  # end

  def to_s
    "My name is #{@name.upcase}"
  end
end

name = 'Fluffy'
fluffy = Pet.new(name)
puts "Expected: Fluffy"
puts fluffy.name

puts "Expected: My name is FLUFFY."
puts fluffy

# puts "Expected: FLUFFY"
puts fluffy.name

# puts "Expected: FLUFFY"
puts name

# Further exploration
puts

name = 42
fluffy = Pet.new(name)
name += 1

puts "Expected: 42"
puts fluffy.name

puts "Expected: My name is 42."
puts fluffy

puts "Expected: 42"
puts fluffy.name

puts "Expected: 43"
puts name

# The value 42 (referenced by variable `name`) is passed to `Pet`'s `initialize` method, which saves the string '42' to instance variable `@name`. When `fluffy` is passed to `puts`, `Pet`'s `to_s` method is invoked, and here, we are able to call `upcase` on `@name` because of the `to_s` in `initialize`; if we never converted `42` to string, we would not be able to call `upcase` on an integer. Then, when `name` is incremented, this is a reassignment (and integers are immutable anyway) which does not impact `fluffy`'s state.