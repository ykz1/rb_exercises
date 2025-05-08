pets = { cat: 'fluffy', dog: ['sparky', 'fido'], fish: 'oscar' }

pets[:dog] << 'bowser'

p pets #=> {:cat=>"fluffy", :dog=>"bowser", :fish=>"oscar"}

=begin
In line 3 when 'bowser' is added, it mistakenly replaced the array of existing pets with a new string 'bowser'.
The intention is to add 'bowser' as a string to the existing array of strings. 
Fixed in line 3 above by pushing 'bowser' to the existing array rather than re-assigning 'bowser' to the existing array.
=end