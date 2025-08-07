require 'pry-byebug'
class GuessingGame
  GUESSES_ALLOWED = 7
  ANSWER_RANGE = 1..100
  def play
    reset
    loop do
      print_guesses_remaining
      prompt_for_guess
      process_guess_print_result
      break if correct_guess? || out_of_guesses?
    end
    print_game_result
  end

  private

  attr_accessor :answer, :guesses_remaining, :guess

  def reset
    @answer = rand(ANSWER_RANGE)
    @guesses_remaining = GUESSES_ALLOWED
  end

  def print_guesses_remaining
    puts
    puts "You have #{guesses_remaining} guesses remaining."
  end

  def prompt_for_guess
    input = nil
    loop do
      print 'Enter a number between 1 and 100: '
      input = gets.chomp.to_i
      print 'Invalid guess. '
      break if ANSWER_RANGE.include?(input)
    end
    self.guess = input
  end

  def process_guess_print_result
    puts  case guess <=> answer
          when -1 then 'Your guess is too low.'
          when 1 then 'Your guess is too high.'
          when 0 then "That's the number!"
          end
    self.guesses_remaining -= 1
  end

  def correct_guess?
    guess == answer
  end

  def out_of_guesses?
    guesses_remaining == 0
  end

  def print_game_result
    puts
    puts (correct_guess? ? 'You won!' : 'You have no more guesses. You lost!')
  end

end

game = GuessingGame.new
game.play

=begin
You have 7 guesses remaining.
Enter a number between 1 and 100: 104
Invalid guess. Enter a number between 1 and 100: 50
Your guess is too low.

You have 6 guesses remaining.
Enter a number between 1 and 100: 75
Your guess is too low.

You have 5 guesses remaining.
Enter a number between 1 and 100: 85
Your guess is too high.

You have 4 guesses remaining.
Enter a number between 1 and 100: 0
Invalid guess. Enter a number between 1 and 100: 80

You have 3 guesses remaining.
Enter a number between 1 and 100: 81
That's the number!

You won!
=end

game.play

=begin
You have 7 guesses remaining.
Enter a number between 1 and 100: 50
Your guess is too high.

You have 6 guesses remaining.
Enter a number between 1 and 100: 25
Your guess is too low.

You have 5 guesses remaining.
Enter a number between 1 and 100: 37
Your guess is too high.

You have 4 guesses remaining.
Enter a number between 1 and 100: 31
Your guess is too low.

You have 3 guesses remaining.
Enter a number between 1 and 100: 34
Your guess is too high.

You have 2 guesses remaining.
Enter a number between 1 and 100: 32
Your guess is too low.

You have 1 guess remaining.
Enter a number between 1 and 100: 32
Your guess is too low.

You have no more guesses. You lost!
=end