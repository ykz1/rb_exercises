require 'pry-byebug'

=begin

Start:  4:10p
Finish: 4:17p
Further exploration finish: 4:29p

Requirements:
- Input:      string
- Output:     boolean true/false
- Operation:  check that 1) all parentheses are properly paired; and 2) in the correct order i.e. open then close

Solution overview:
- We want to start at level 0, the topmost level
- For every open parenthesis we come across, we are one level deeper
- For every close parenthesis we come across, we move back one level
- At the end of our string, we need to be back at level 0

- Iterate through all characters of string
- Starting at level 0, += 1 for every open parenthesis, and -= 1 for every closed parenthesis
- Return false if level reaches negative

=end
def balanced?(str)
  level = 0
  str.chars.each do |char|
    level += 1 if char == '('
    level -= 1 if char == ')'
    return false if level < 0
  end
  level == 0
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
p balanced?('What ())(is() up') == false

# Further exploration:
# Expand to also balance {}, [], '', and ""
# We want to iterate once through our chars and check for all 5 types 

def balanced2?(str)
  levels = {
    brackets: 0,
    square: 0,
    squiggly: 0,
    single: 0,
    double: 0,
  }
  str.chars.each do |char|
    if %W(( ) [ ] { } ' ").include?(char)
      case char
      when '(' then levels[:brackets] += 1
      when ')' then levels[:brackets] -= 1
      when '[' then levels[:square] += 1
      when ']' then levels[:square] -= 1
      when '{' then levels[:squiggly] += 1
      when '}' then levels[:squiggly] -= 1
      when "'" then levels[:single] = 1 - levels[:single]
      when '"' then levels[:double] = 1 - levels[:double]
      end
    end
    return false if levels.values.any? { |value| value < 0 }
  end
  levels.values.all? { |value| value == 0 }
end

puts
p balanced2?('What (is) this?') == true
p balanced2?('What is) this?') == false
p balanced2?('What (is this?') == false
p balanced2?('((What) (is this))?') == true
p balanced2?('((What)) (is this))?') == false
p balanced2?('Hey!') == true
p balanced2?(')Hey!(') == false
p balanced2?('What ((is))) up(') == false
p balanced2?('What ())(is() up') == false
puts
p balanced2?('"what') == false
p balanced2?('"what"') == true
p balanced2?('}what""') == false
p balanced2?(%Q("He said 'Hello' to me")) == true
p balanced2?('She said "Hi"') == true
p balanced2?('') == true
p balanced2?('"first" "second"') == true

def balanced3?(str)
  levels = {
    brackets: 0,
    square: 0,
    squiggly: 0,
    single: 0,
    double: 0,
  }
  last_open = nil
  str.chars.each do |char|
    if %W(( ) [ ] { } ' ").include?(char)
      case char
      when '(' 
        levels[:brackets] += 1
        last_open = :brackets
      when ')' 
        return false if last_open != :brackets
        levels[:brackets] -= 1
      when '[' 
        levels[:square] += 1
        last_open = :square
      when ']' 
        return false if last_open != :square
        levels[:square] -= 1
      when '{' 
        levels[:squiggly] += 1
        last_open = :squiggly
      when '}' 
        return false if last_open != :squiggly
        levels[:squiggly] -= 1
      when "'" then levels[:single] = 1 - levels[:single]
      when '"' then levels[:double] = 1 - levels[:double]
      end
    end
    return false if levels.values.any? { |value| value < 0 }
  end
  levels.values.all? { |value| value == 0 }
end

puts
p balanced3?('What (is) this?') == true
p balanced3?('What is) this?') == false
p balanced3?('What (is this?') == false
p balanced3?('((What) (is this))?') == true
p balanced3?('((What)) (is this))?') == false
p balanced3?('Hey!') == true
p balanced3?(')Hey!(') == false
p balanced3?('What ((is))) up(') == false
p balanced3?('What ())(is() up') == false
puts
p balanced3?('"what') == false
p balanced3?('"what"') == true
p balanced3?('}what""') == false
p balanced3?(%Q("He said 'Hello' to me")) == true

p balanced3?('[(])') == false
=begin

Requirements:
- Quotes:
  - If not already open, then ' and " both opens single and double quote 
  - When open, no stack tracing for any brackets because we're now in a quote
  - When closing quotes, closes until the previous stack, so a " ' " would both remove the inner single quote that's open as well as the higher level double quote
- Brackets:
  - Stack tracing only when not in a quote
  - ( [ and { open brackets
  - ) ] and } close brackets
  - If a bracket is open, must be closed before closing other brackets

- Solution
- recognized characters to be processed as <type> <action>
  - (: regular open
  - ): regular close
  - [: square open
  - ]: square close
  - {: squiggly open
  - }: squiggly close
  - ': single flip
  - ": double flip
- Actions:
  - open: if not in a quote, then add type to stack
  - close: if not in a quote, then remove type from stack but return false if type mismatch between type that we are action and the last type in stack
  - flip: if type being flipped exists in stack, remove stack top-down until same type is removed
  
=end

def balanced4?(str)
actions = {
  '(': 'regular open',
  ')': 'regular close',
  '[': 'square open',
  ']': 'square close',
  '{': 'squiggly open',
  '}': 'squiggly close',
  "'": 'single flip',
  '"': 'double flip'
}

stack = ''

str.chars.each do |char|
  if actions.key?(char)
    instruction = actions[char]

end