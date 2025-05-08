colors = 'blue pink yellow orange'
puts colors.include?('yellow')
puts colors.include?('purple')

# Further exploration below
colors = 'blue boredom yellow'
puts colors.include?('red')         # this will print true because the letters 'red' are in 'boredome'
colors_array = colors.split(' ')
puts colors_array.include?('red')   # this will print false because now we are looking for the a match of the full string 'red' against elements within an array
