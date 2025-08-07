def method(default: 0)
  puts format('%<default>d', default: default)
end

method()

method(default: 1)
method(default: 100)
