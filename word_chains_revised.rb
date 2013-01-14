class Hangman

  def initialize

  end

  def game_loop

    won = false

  end

  def game_mode
    puts "Press 1 to choose a word, press 2 to guess a word!"
    command = gets.chomp
    case command
    when "1"
      choosing_game
    when "2"
      guessing_game
    else
      puts "invalid entry, choose 1 or 2"
      game_mode
    end
  end

  def choosing_game

  end

  def guessing_game

  end

  def blank_game_board
    word_length = get_word_length
    game_board = []
    word_length.times do
      game_board << "_"
    end
  end

  def get_word_length(word)
    word.length
  end
end


class Player



end


class HumanPlayer < Player



end


class ComputerPlayer < Player



end