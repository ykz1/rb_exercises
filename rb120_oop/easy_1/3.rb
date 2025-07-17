class Book
  attr_reader :title, :author

  def initialize(author, title)
    @author = author
    @title = title
  end

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new("Neil Stephenson", "Snow Crash")
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

# Further exploration: we need a getter method to be able to call `book.title` and `book.author`, so we're down to `attr_reader` and `attr_accessor`. The latter would work but would extend the user's capabilities beyond just read to write as well, which we likely want to restrict.

# Adding functions to retrieve `@title` and `@author`  would work the same as `attr_reader :title, :author`. The advantage would be if we wanted to alter what is returned when these functions are called—it would be simpler to do so with the methods defined normally.