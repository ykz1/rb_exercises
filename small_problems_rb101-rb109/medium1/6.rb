# Notes
# Stack: basically a collection
# Register: current value of a stack, not part of the stack

# MULT:
# - multiplies stack value with register value
# - removes value from stack
# - stores result back into register

# Problem: 
# - We are writing a method which takes a string input, deciphers that string into an instruction or set of instructions and perform those instructions.
# - In deciphering the string input, there are specific keywords we should look out for—these keywords should perform specific actions

# Test cases: given by example

# Data:
# - We probably want to work with an array to first split the string into word-by-word instructions 
# - As we iterate through this array of instructions, we will need to store our stack into another collection, most likely an array
# - We will also need to store our register, which seems to always be a number and should probably be an integer. It looks like the register starts at 0
# - We should also write sub-programs or helper methods to perform the specific actions defined by keywords

# Algorithm:
# - Take string input and save it as an array of instructions, each element being a substring in the original string (as delimited by space)
# - Initialize the register at value 0
# - Iterate through our instructions, and
#   - When we see a number, store that number into the register
#   - When we see a non-number, invoke the correct helper method depending on what the word is

# Example: '5 PUSH 3 MULT PRINT' should be
# - 5: save to register | stack = []; register = 5
# - PUSH: push register to stack | stack = [5]; register = 5
# - 3: save to register | stack = [5]; register = 3
# - MULT: pop last element from stack, multiply by register, save product to register | stack = [], register = 15
# - PRINT: print register | no change

def minilang(str)
  instruction = str.split
  register = 0
  stack = []
  instruction.each do |input|
    if input.to_i.to_s == input
      register = input.to_i
    else
      case input
      when 'PUSH' then stack << register
      when 'ADD' then register += stack.pop
      when 'SUB' then register -= stack.pop
      when 'MULT' then register *= stack.pop
      when 'DIV' then register /= stack.pop
      when 'MOD' then register %= stack.pop
      when 'POP' then register = stack.pop
      when 'PRINT' then puts register
      else return'ERROR: Invalid token.'
      end
    end
  end
  nil
end

puts
minilang('PRINT')
# 0

puts
minilang('5 PUSH 3 MULT PRINT')
# 15

puts
minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

puts
minilang('5 PUSH POP PRINT')
# 5

puts
minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

puts
minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

puts
minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

puts
minilang('-3 PUSH 5 SUB PRINT')
# 8

puts
minilang('6 PUSH')
# (nothing printed; no PRINT commands)

# Further exploration:
minilang('3 PUSH 4 PUSH 5 MULT ADD PUSH 7 SUB PUSH 5 PUSH 3 MOD DIV')
# Note: very interesting that despite the brackets and order of operation, we can process our instruction left-to-right using the program we wrote.

# Further exploration:
p minilang('3 PUSH 4 DIV') #=> should return nil
p minilang('3 PUSH 4 DIVIDE') #=> should return error message