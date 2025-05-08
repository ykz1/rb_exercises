state = 'tExAs'

state_capitalized = state.capitalize
p state_capitalized
p state             # note that the original variable is unaltered

state.capitalize!   # changes the original variable
p state