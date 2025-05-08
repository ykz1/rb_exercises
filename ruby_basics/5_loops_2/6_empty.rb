names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do
  names.shift
  break if names.empty?
end
p names