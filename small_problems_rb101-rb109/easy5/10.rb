def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

spin_me("hello world") # "olleh dlrow"

# No, the returned string will be a new object that's different than the one passed in as an argument. This is because #split returns a new array.