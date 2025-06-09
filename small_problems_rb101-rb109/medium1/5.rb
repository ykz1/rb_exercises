# Notes:
# n = number of rows
# middle = (n / 2.0).ceil
# max_length = n
# lines start at 1 and go up in increments of 2 until middle, then back down to 1
# lines are centered on length n strings

def diamond(n)
  middle = (n / 2.0).ceil
  (1..middle).each { |row| puts ('*' * (row * 2 - 1)).center(n) }
  ((middle + 1)..n).each { |row| puts ('*' * ((n - row + 1) * 2 - 1)).center(n) }
end

diamond(1)
diamond(3)
diamond(9)

# Further exploration:

def diamond2(n)
  middle = (n / 2.0).ceil
  (1..middle).each { |row| puts add_spaces(('*' * (row * 2 - 1)).center(n)) }
  ((middle + 1)..n).each { |row| puts add_spaces(('*' * ((n - row + 1) * 2 - 1)).center(n)) }
end

def add_spaces(str)
  # Regex explanation: (\*{3,}) looks for 3 or more successive *s and captures the string into a match object. We then replace the matched object with a string of '*'s at the beginning and end with ' 's in the middle where total length of string matches the matched string.
  str.gsub(/(\*{3,})/) { |match| '*' + ' ' * (match.length - 2) + '*' }
end

diamond2(1)
diamond2(3)
diamond2(9)
diamond2(11)

=begin
# Another way we can describe our diamond is to start center-out, and with each iteration add stars to our existing diamond's perimeter. We can use a hash
def diamond3(n)
  # Create an array of n x n
  grid = (1..n).map { |row| (1..n).map { |column| '' } }
  middle_index = n / 2
  grid[middle_index][middle_index] = '*'
  
  draw_iterations = (n / 2.0).ceil

  draw_iterations.times { add_char(grid) }

  grid.each { |row| p row }
end

def add_char(grid, char='*')
  n = grid.size
  0.upto(n - 1) do |row|
    0.upto(n - 1) do |column|
      lookup = [  grid[row][column],
                  grid[row][column + 1],
                  grid[row][column - 2],
                  grid[row + 1][column],
                  grid[row - 1][column],
               ]
      lookup.include?('*') ? '*' : ''
    end
  end
end

diamond3(5)
=end