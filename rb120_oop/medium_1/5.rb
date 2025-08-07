class EmptyStackError < StandardError
end

class Minilang
  def initialize(instruction)
    @instructions = instruction.split
    @register = 0
    @stack = []
  end

  def eval
    @instructions.each do |token|
      if token.to_i.to_s == token
        place(token) 
      else
        begin
          self.send token.downcase.to_sym
        rescue EmptyStackError 
          puts 'Empty stack!'
          return
        rescue NoMethodError
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
    if @stack.empty?
      raise EmptyStackError 
    else
      return @stack.pop
    end
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