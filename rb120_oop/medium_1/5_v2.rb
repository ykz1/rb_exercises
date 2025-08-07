class MinilangError < StandardError; end
class EmptyStackError < MinilangError; end
class BadTokenError < MinilangError; end

class Minilang
  VALID_TOKENS = Set.new %w(PUSH ADD SUB MULT DIV MOD POP PRINT)
  def initialize(program)
    @program = program
  end

  def eval(**variables)
    instructions = format(@program, variables).split
    @register = 0
    @stack = []
    instructions.each do |token|
      if token.to_i.to_s == token
        place(token)
      else
        begin
          raise BadTokenError unless VALID_TOKENS.include?(token)
          self.send token.downcase.to_sym
        rescue EmptyStackError 
          puts 'Empty stack!'
          return
        rescue BadTokenError
          puts "Invalid token: #{token}"
          return
        end
      end
    end
  end

  private
  
  def place(n)
    @register = n.to_i
  end

  def push
    @stack << @register
  end

  def add
    @register += stack_pop
  end

  def sub
    @register -= stack_pop
  end

  def mult
    @register *= stack_pop
  end

  def div
    @register /= stack_pop
  end

  def mod
    @register %= stack_pop
  end
  
  def pop
    @register = stack_pop
  end

  def stack_pop
    raise EmptyStackError if @stack.empty?
    @stack.pop
  end

  def print
    puts @register
  end
end

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)

CENTIGRADE_TO_FAHRENHEIT =
  '5 PUSH %<degrees_c>d PUSH 9 MULT DIV PUSH 32 ADD PRINT'

minilang = Minilang.new(CENTIGRADE_TO_FAHRENHEIT)
minilang.eval(degrees_c: 100)
# 212
minilang.eval(degrees_c: 0)
# 32
minilang.eval(degrees_c: -40)
# -40

MILE_TO_KM = '3 PUSH %<miles>d PUSH 5 MULT DIV PRINT'

minilang2 = Minilang.new(MILE_TO_KM)
minilang2.eval(miles: 6)
minilang2.eval(miles: 13)

AREA_OF_TRIANGLE = '2 PUSH %<height>d PUSH %<base>d MULT DIV PRINT'

minilang3 = Minilang.new(AREA_OF_TRIANGLE)
minilang3.eval(height: 10, base: 15)
# 75
minilang3.eval(height: 20, base: 3)
# 30