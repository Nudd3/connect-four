# frozen_string_literal: false

require_relative 'board'
require_relative 'player'
require_relative 'miscellaneous'

# Class for playing the game
class Game
  include Miscellaneous

  attr_reader :board

  def initialize
    generate_players
    @board = Board.new
    puts "Player 1: #{@player1}"
    puts "Player 2: #{@player2}"
  end

  def play
    board.print_board
    take_turns
  end

  def take_turns
    @turn = 1
    until board.full?
      current_player = player_turn
      choice = player_input(current_player)
      @board.update_board(choice, current_player.symbol)
      @board.print_board
      break if winner?
    end
    print draw_message
  end

  # private

  def player_turn
    @turn += 1
    @turn.odd? ? @player1 : @player2
  end

  def player_input(player)
    puts "It's #{player.name}'s (#{player.symbol}):"
    loop do
      print 'Please choose a place to put your symbol: '
      input = gets.chomp.to_i
      return input if verify_input
    end
  end

  def verify_input(input)
    unless input.is_a?(Integer) && input.between?(1, 7) 
      puts 'Input needs to be between 1 and 7'
      return false
    end
    if @board.full_column?(input)
      puts 'That column is full'
      return false
    end

    true
  end

  def generate_players
    @player1 = create_player(1)
    @player2 = create_player(2)
  end

  def create_player(player_number)
    print "Input name of player ##{player_number}: "
    player_name = gets.chomp
    symbol = player_number == 1 ? red_circle : blue_circle
    Player.new(player_name, symbol)
  end
end

g = Game.new
g.board.print_board
