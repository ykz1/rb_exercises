require 'pry-byebug'

class GuessingGame
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

  attr_accessor :answer, :guesses_remaining, :guess, :answer_range, :guesses_allowed

  def initialize(low, high)
    @answer_range = low..high
    @guesses_allowed = Math.log2(high - low + 1).to_i + 1
  end

  def reset
    @answer = rand(answer_range)
    @guesses_remaining = guesses_allowed
  end

  def print_guesses_remaining
    puts
    if guesses_remaining == 1
      puts "You have 1 guess remaining"
    else
      puts "You have #{guesses_remaining} guesses remaining."
    end
  end

  def prompt_for_guess
    input = nil
    loop do
      print "Enter a number between #{answer_range.min} and #{answer_range.max}: "
      input = gets.chomp.to_i
      break if answer_range.include?(input)
      print 'Invalid guess. '
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

game = GuessingGame.new(501, 1500)
game.play