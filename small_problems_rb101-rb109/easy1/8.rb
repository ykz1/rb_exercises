print "Enter a noun: "
noun = gets.chomp

print "Enter a verb: "
verb = gets.chomp

print "Enter an adjective: "
adjective = gets.chomp

print "Enter an adverb: "
adverb = gets.chomp

puts [
  "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!",
  "He #{adverb} #{verb}s on your #{adjective} #{noun}",
  "The #{adjective} #{noun} is #{verb}ing #{adverb}",
].sample