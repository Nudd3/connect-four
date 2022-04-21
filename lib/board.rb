# frozen_string_literal: false

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

  def winner?
    horizontal_winner? || vertical_winner? || diagonal_winner?
  end

  def horizontal_winner?
    board.each do |row|
      row.each_cons(4) do |sub_column|
        return true if sub_column.uniq.size == 1 && !sub_column.all?(nil)
      end
    end
    false
  end

  def vertical_winner?
    board.transpose.each do |row|
      row.each_cons(4) do |sub_column|
        return true if sub_column.uniq.size == 1 && !sub_column.all?(nil)
      end
    end
    false
  end

  def diagonal_winner?
    right_down_diagonal || right_up_diagonal
  end

  def right_down_diagonal
    (0...COLUMN_COUNT - 3).each do |c| # Correct
      (0...ROW_COUNT - 3).each do |r| # Correct
        if board[r][c] == 'X' && board[r + 1][c + 1] == 'X' && board[r + 2][c + 2] == 'X' && board[r + 3][c + 3] == 'X'
          return true
        end
      end
    end
    false
  end

  # 4 & 3
  def right_up_diagonal
    (0...COLUMN_COUNT - 3).each do |c| # Correct
      (3...ROW_COUNT).each do |r| 
        if board[r][c] == 'X' && board[r - 1][c + 1] == 'X' && board[r - 2][c + 2] == 'X' && board[r - 3][c + 3] == 'X'
          return true
        end
      end
    end
    false
  end
end