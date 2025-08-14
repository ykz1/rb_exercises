def star(num)
  middle = num / 2 + 1
  (1..num).each do |row|
    line = ''
    (1..num).each do |col|
      vertical_line = (col == middle)
      horizontal_line = (row == middle)
      diagonal1_line = (col == row)
      diagonal2_line = (col == (num - row + 1))
      line += ((vertical_line || horizontal_line || diagonal1_line || diagonal2_line) ? '*' : ' ')
    end
    puts line
  end
end

star(7)
puts
star(9)