# frozen_string_literal: false

# class representing the board in the game
class Board
  attr_accessor :board

  ROW_COUNT = 6
  COLUMN_COUNT = 7

  # 1. Create a board
  def initialize
    @board = Array.new(6) { Array.new(7) }
  end

  def update_board(place, symbol)
    start = 5
    until start == -1
      if board[start][place - 1].nil?
        board[start][place - 1] = symbol
        return true
      else
        start -= 1
      end
    end
    false
  end

  def full_column?(column)
    !board[0][column - 1].nil?
  end

  def full_board?
    board[0].all?
  end

  def print_board
    board.to_a.each { |r| puts r.inspect }
  end

  def winner?(symbol)
    horizontal_winner?(symbol) || vertical_winner?(symbol) || diagonal_winner?(symbol)
  end

  def horizontal_winner?(symbol)
    board.each do |row|
      row.each_cons(4) do |sub_column|
        #return true if sub_column.uniq.size == 1 && !sub_column.all?(nil)
        return true if sub_column.all?(symbol)
      end
    end
    false
  end

  def vertical_winner?(symbol)
    board.transpose.each do |row|
      row.each_cons(4) do |sub_column|
        #return true if sub_column.uniq.size == 1 && !sub_column.all?(nil)
        return true if sub_column.all?(symbol)
      end
    end
    false
  end

  def diagonal_winner?(symbol)
    right_down_diagonal(symbol) || right_up_diagonal(symbol)
  end

  def right_down_diagonal(symbol)
    (0...COLUMN_COUNT - 3).each do |c| # Correct
      (0...ROW_COUNT - 3).each do |r| # Correct
        if board[r][c] == symbol && board[r + 1][c + 1] == symbol && board[r + 2][c + 2] == symbol && board[r + 3][c + 3] == symbol
          return true
        end
      end
    end
    false
  end

  # 4 & 3
  def right_up_diagonal(symbol)
    (0...COLUMN_COUNT - 3).each do |c| # Correct
      (3...ROW_COUNT).each do |r| 
        if board[r][c] == symbol && board[r - 1][c + 1] == symbol && board[r - 2][c + 2] == symbol && board[r - 3][c + 3] == symbol
          return true
        end
      end
    end
    false
  end
end
