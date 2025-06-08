def swap_name(str)
  name = str.split
  first = name[0]
  last = name[-1]
  "#{last}, #{first}"
end

p swap_name('Joe Roberts') == 'Roberts, Joe'

def swap_name2(name)
  name.split.reverse.join(', ')
end

p swap_name2('Joe Roberts') == 'Roberts, Joe'
