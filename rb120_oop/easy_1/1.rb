class Banner
  def initialize(message, min_width=5)
    @message = message
    @min_width = min_width
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+-#{'-' * width}-+"
  end

  def empty_line
    "| #{' ' * width} |"
  end

  def message_line
    "| #{@message.center(width)} |"
  end

  private

  def width
    [@message.length, @min_width].max
  end
end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner

=begin
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+
=end

banner = Banner.new('')
puts banner

=begin
+--+
|  |
|  |
|  |
+--+
=end

banner2 = Banner.new('Hi')
puts banner2

banner3 = Banner.new('Hi', 20)
puts banner3