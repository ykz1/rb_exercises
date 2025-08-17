require 'pry-byebug'

# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." } 
puts my_proc 
puts my_proc.class
my_proc.call 
my_proc.call('cat') 

# Procs save a block of code for later execution. Procs have lenient arity—when procs are invoked, they can be passed any number of arguments, regardless of the number of parameters defined in the block that they represent.

puts

# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')
my_lambda.call rescue puts "Exception: #{$!}"
begin
  my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." } 
rescue => e
  puts "Exception: #{e.message}"
end

# Lambdas are not a class themselves, but rather a type of Proc—we cannot create a new lambda object with `Lambda.new` and must use either `lambda` or the literal `->`. Lambdas also have stric arity, meaning that upon invocation, they must be passed the right number of arguments matching the number of defined parameters in the block they represent.

puts

# Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
block_method_1('seal') rescue puts "Exception: #{$!}"

# Blocks passed to method invocations have lenient arity—when invoked via `yield` in the method definition, they do not need to be passed an exact number of arguments matching the number of parameters in the block.

# However, `yield` when used in a method definition require that a block be passed to the method's invocation, otherwise an exception is thrown: no block given.

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
begin
  block_method_2('turtle') { puts "This is a #{animal}."}
rescue => e
  puts "Exception: #{e.message}"
end

# Line 50 here shows the lenient arity of `yield` and the blocks they yield to. One argument is passed by `yield`, and even though the block takes two parameters, the block still executes; assigning the second parameter the value `nil`.

# Line 50 similarly shows that the block executes when `yield` passes one argument even though the block has no parameters. The exception thrown is because `animal` is not a defined variable within the block.