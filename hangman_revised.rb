class Hangman

  attr_accessor :word, :dictionary_array

  def initialize
    @word = ""
    @dictionary_array = dictionary_array
    @game_board = []
    @game_mode = "human guess"
  end

  def dictionary_array
    dictionary = []
    File.foreach("dictionary.txt") do |line|
      dictionary << line.chomp
    end
    dictionary
  end

  def game_loop

    until game_won?


    end

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
      play_choosing_game
    when "2"
      @game_mode = "human guess"
      play_guessing_game
    else
      puts "invalid entry, choose 1 or 2"
      game_mode
    end
  end

  # def play_choosing_game
  #   player chooses word
  #   store word
  #   create board
  #   evaluate guess
  #   change board
  #   store/show guesses
  #   store attempts
  # end

  # def play_guessing_game
  #   choose word
  #   store word
  #   create board
  #   prompt user
  #   evaluate guess v
  #   change board v
  #   store/show guesses
  #   store attempts
  # end

  def choose_word
    case @game_mode
    when "computer guess"
      @word = computer_guess
    when "human guess"
      puts "Choose a word! (It must be in the dictionary)"
      @word = gets.chomp
    end
  end

  def computer_guess
    @dictionary_array.sample
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

  def self.blank_game_board(word)
    word_length = word.length
    game_board = []
    word_length.times do
      game_board << "_"
    end
    game_board
  end

  # Interface stuff
  def self.show_board
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

p game.choose_word