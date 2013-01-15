class Hangman

  attr_accessor :word, :dictionary_array

  def initialize
    @word = ""
    @dictionary_array = dictionary_array
    @game_board = []
    @game_mode = ""
  end

  def dictionary_array
    dictionary = []
    File.foreach("dictionary.txt") do |line|
      dictionary << line.chomp
    end
    dictionary
  end

  def game_loop
    game_mode
    choose_word
    blank_game_board(@word)
    until game_won?
      guess = human_guess
      if take_guess(guess)
        place_letters(guess)
      end
      show_board
    end
    puts "You've won!"
    puts "The word was #{@game_board.join("")}"
  end

  def game_won?
    @game_board.join("") == @word
  end

  def game_mode
    puts "Press 1 to choose a word, press 2 to guess a word!"
    command = gets.chomp
    case command
    when "1"
      @game_mode = "computer guess"
      # play_choosing_game
    when "2"
      @game_mode = "human guess"
      # play_guessing_game
    else
      puts "invalid entry, choose 1 or 2"
      game_mode
    end
  end

  # def play_choosing_game
  #   player chooses word v
  #   store word v
  #   create board v
  #   evaluate guess v
  #   change board v
  #   store/show guesses
  #   store attempts
  # end

  # def play_guessing_game
  #   choose word v
  #   store word v
  #   create board v
  #   prompt user
  #   evaluate guess v
  #   change board v
  #   store/show guesses
  #   store attempts
  # end

  def choose_word           #Vincent - what the "when"s execute should probably be calls to methods of the same name
    case @game_mode           # that reside in the HumanPlayer and ComputerPlayer classes.
    when "computer guess"
      puts "Choose a word! (It must be in the dictionary)"
      @word = gets.chomp
    when "human guess"
      @word = computer_guess
    end
  end

  def take_guess(letter)    #Vincent - I'm not sure that you want the Hangman class to ever know what the secret word is.
    if guess_correct?(letter)   # You could have each respective HumanPlayer and ComputerPlayer classes check the guess
      puts "correct guess!"     # and tell the Hangman class how to update the board.
      true
    else
      puts "incorrect guess!"
      false
    end
  end

  def human_guess         #Vincent - human_guess should be a method in HumanPlayer just called "guess".
    puts "Make a guess!"
    guess = gets.chomp
    if guess.class != String && guess.length != 1
      puts "Invalid entry! Try again."
      human_guess
    else
      guess
    end
  end

  def computer_guess      #Vincent - computer_guess should be a method in ComputerPlayer just called "guess".
    @dictionary_array.sample  # The game mode should dictate whether the HumanPlayer or ComputerPlayer "guess" methods are called.
  end

  def guess_correct?(letter)
    @word.split("").include?(letter)
  end

  def place_letters(letter)
    # word = "testing"
    # game_board = ["_", "_", "_", "_", "_", "_", "_"]
    @word.split("").each_with_index do |l, index|
      if letter == l
        @game_board[index] = letter
      end
    end
    # game_board
  end

  def blank_game_board(word)
    word_length = word.length
    game_board = []
    word_length.times do
      game_board << "_"
    end
    @game_board = game_board
  end

  # Interface stuff
  def show_board
    puts "here is your game board"
    puts @game_board.join(" ")
  end


end


class Player



end


class HumanPlayer < Player



end


class ComputerPlayer < Player


end

game = Hangman.new
# p game.dictionary_array

p game.game_loop
