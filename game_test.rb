def guess_correct?(letter)

  word.split("").include?(letter)
end

# p guess_correct?('b')

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

p place_letters("t")