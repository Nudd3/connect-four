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
      puts "hello"
      
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
    right_diagonal || left_diagonal
  end

  def right_diagonal
    puts "inside"
    for c in (0..board.size - 3) do
      puts "inside1"
      for r in (0..board[0].length - 3) do
        puts "inside2"
        if board[r][c] == 'X' && board[r+1][c+1] == 'X' && board[r+2][c+2] == 'X' && board[r+3][c+3] == 'X'
          return true
        end
      end
    end
    false 
  end

  def left_diagonal; end

end

b = Board.new
b.update_board(2, 'O')
b.update_board(2, 'X')
b.update_board(2, 'O')
b.update_board(2, 'X')
b.update_board(2, 'O')

b.print_board
puts "\n\n"
#puts b.right_diagonal
puts "\n\n\n"