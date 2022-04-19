# frozen_string_literal: false

class Board
  attr_accessor :board

  # 1. Create a board
  def initialize
    @board = Array.new(6) { Array.new(7) }
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

  def full_column?(column)
    !board[0][column - 1].nil?
  end

  def full_board?
    [board[0][0], board[0][1], board[0][2], board[0][3],
     board[0][4], board[0][5], board[0][6]].all?
  end

  def print_board
    board.to_a.each { |r| puts r.inspect }
  end

  def winner?
    horizontal_check || vertical_check || diagonal_check
  end

  def horizontal_check
    board.each do |row|
      row.each_cons(4) do |sub_column|
        puts "#{sub_column}\n"
        return true if sub_column.uniq.size == 1 && !sub_column.all?(nil)
      end
    end
    false
  end

  def vertical_check 
    false
  end

  def diagonal_check
    false
  end
end

b = Board.new
b.update_board(1, 'X')
b.update_board(5, 'X')
b.update_board(6, 'X')
b.update_board(7, 'X')
b.print_board
puts "\n\n"
puts b.winner?