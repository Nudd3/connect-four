# frozen_string_literal: false

require_relative 'board'
require_relative 'player'
require_relative 'miscellaneous'

# Class for playing the game
class Game
  include Miscellaneous

  def initialize
    create_players
    @board = Board.new
  end

  def generate_players
    @player1 = create_player(1)
    @player2 = create_player(2)
  end

  def create_player(player_number)
    p prompt_player_name(player_number)
    player_name = gets.chomp
    
  end

end