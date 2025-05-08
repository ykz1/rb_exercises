first_name = 'John'
last_name = 'Doe'

full_name = first_name + ' ' + last_name

p full_name

# Alternative below
full_name_2 = [first_name, last_name].join(" ")
p full_name_2

# 2 more alternative that mutate the original variables
first_name = 'John'
last_name = 'Doe'
full_name_3 = first_name.concat(" ", last_name)
p full_name_3

first_name = 'John'
last_name = 'Doe'
full_name_4 = first_name << " " << last_name
p full_name_4