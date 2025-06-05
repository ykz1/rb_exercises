def swapcase(str)
  swap = Proc.new { |char| (char == char.upcase) ? char.downcase : char.upcase }
  str.chars.map(&swap).join
end

p swapcase('PascalCase') == 'pASCALcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'