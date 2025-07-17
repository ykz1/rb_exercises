class Book
  attr_accessor :author, :title

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new
book.author = "Neil Stephenson"
book.title = "Snow Crash"
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)


# Further Exploration: the pro is that users can enter information in a modular way, and sometimes they might not have the author's name or the full title but want to enter the book with incomplete information. The con is that we may have dirtier / incomplete data.