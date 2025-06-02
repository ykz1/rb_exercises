def cleanup(str)
  str.gsub(/[^a-zA-Z]+/,' ')
end
p cleanup("---what's my +*& line?") == ' what s my line '
p cleanup("hello***world+++bye")


# [a-zA-Z] would capture any alphabetical character
# ^ negates, which means any non-alphabetical character
# + means one to capture one or more grouped non-alphabetical character together to be substituted
# ' ' is what we are replacing our captured characters with
