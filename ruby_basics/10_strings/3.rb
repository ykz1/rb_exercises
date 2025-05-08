name = 'Roger'

puts name.downcase == 'RoGeR'.downcase
puts name.downcase == 'DAVE'.downcase

# Alternate version below

puts (name.casecmp('RoGer')) == 0
puts (name.casecmp('DAVE')) == 0
