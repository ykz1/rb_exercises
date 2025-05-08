# Each player starts with the same basic stats.

player = { strength: 10, dexterity: 10, charisma: 10, stamina: 10 }

# Then the player picks a character class and gets an upgrade accordingly.

character_classes = {
  warrior: { strength:  20 },
  thief:   { dexterity: 20 },
  scout:   { stamina:   20 },
  mage:    { charisma:  20 }
}

puts 'Please type your class (warrior, thief, scout, mage):'
input = gets.chomp.downcase.to_sym

player.merge!(character_classes[input])

puts 'Your character stats:'
puts player

# There are two errors here, both occuring on line 17. 
# The first is that calling merge on player returns a new hash and does not actually change the stats saved in player. The fix here is to simply use `merge!` instead. This has been fixed above.
# The second error is a type error: the input passed as a key to character_classes is a string entered by the user, but character_classes expects a symbol as a key. The simple fix here would be to convert input from a string to a symbol in line 15 by appending `.to_sym`. This has been fixed above.