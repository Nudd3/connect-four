# frozen_string_literal: false

class Board
  attr_accessor :board

  # 1. Create a board
  def initialize
    @board = create_board
  end

  def update_board(place, symbol)
    start = 5
    until start == -1
      if board[start][place - 1] == symbol
        start -= 1
      elsif board[start][place - 1].nil?
        board[start][place - 1] = symbol
        return true
      end
    end
    false
  end

  def create_board
    Array.new(6) { Array.new(7) }
  end

  def print_board
    @board.to_a.each { |r| puts r.inspect }
  end
end
