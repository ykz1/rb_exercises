colors = ['red', 'yellow', 'purple', 'green', 'dark blue', 'turquoise', 'silver', 'black']
things = ['pen', 'mouse pad', 'coffee mug', 'sofa', 'surf board', 'training mat', 'notebook']

colors.shuffle!
things.shuffle!

i = 0
loop do
  break if i > colors.length

  if i == 0
    puts 'I have a ' + colors[i] + ' ' + things[i] + '.'
  else
    puts 'And a ' + colors[i] + ' ' + things[i] + '.'
  end

  i += 1
end

# There are 8 elements in colors and 7 in things. 
# The loop starting on line 8 will iterate as many times as there are elements in colors, which is 8. 
# On the 8th iteration, things[7] will return nil.
# Line 14 is where the exception is raised, when trying to puts expect strings but is given nil with things[7].

# There are a few ways to fix this depending on user requirements.
# First would be if there are only 7 things, and we want each of those 7 things to have one of the 8 available colors. To do this, we would simply change line 9 to iterate until things.length (i.e. 7) instead of colors.length (i.e. 8). Note that one color would be unused.
# Another possible interpretation is that we have 7 unique items but 8 items total; i.e. one of the items comes in two colors. In this case, we can add the following immediately after declaring out two variables, on line 3:

things[7] = things.sample