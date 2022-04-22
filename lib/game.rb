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

  def take_turns; end

  private

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