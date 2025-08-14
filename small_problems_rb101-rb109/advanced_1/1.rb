ADJECTIVES = %w(quick lazy sleepy ugly)
NOUNS = %w(fox dog head leg)
VERBS = %w(jumps lifts bites licks)
ADVERBS = %w(easily lazily noisily excitedly)
string = File.read('sample_file.txt')

generators = {
  adjective: ADJECTIVES.sample,
  noun: NOUNS.sample,
  verb: VERBS.sample,
  adverb: ADVERBS.sample
}

puts format(string, generators) 