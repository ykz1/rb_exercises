def compute
  block_given? ? yield : 'Does not compute.'
end


p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

def compute2(int=0)
  block_given? ? yield(int) : 'Does not compute.'
end

p compute2 { 5 + 3 } == 8
p compute2 { 'a' + 'b' } == 'ab'
p compute2(3) { |num| num + 5 } == 8
p compute2(3) == 'Does not compute.'