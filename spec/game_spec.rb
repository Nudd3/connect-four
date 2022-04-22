# frozen_string_literal: false

require 'game'
require 'miscellaneous'
require 'board'
# What happens in the game class?
# 1. Create the players and the board
# 2. Start the game
# 3. Players take turns
#    *- Verify the input: Only numbers 1 - 7
#     - Check that column isn't full
#     - After each turn -> Check for winner and print board

# What methods needs to be checked?
# - play -> No, since all methods are tested elsewhere
# - player_turn -> Yes, make sure that it's every other
# - player_input -> Yes, make sure that input is verified
# - game_over? -> Yes, if there's a winner or a tie

describe Game do
  describe '#player_turn' do
    context 'after each play the turn swaps' do
      it 'is player1 before first play'

      it 'is player2 after first play'
    end
  end

  describe '#verify_input' do
    subject(:input_testing) { described_class.new }
    context 'when input is good' do
      it 'is truthy' do
        valid_input = 5
        expect(input_testing.verify_input(valid_input)).to be true
      end
    end

    context 'when input is bad' do
      it 'is falsy when input a digit outside 1-7' do
        unvalid_input = 8
        expect(input_testing.verify_input(unvalid_input)).to be false
      end

      it 'is falsy when input is not a digit' do
        unvalid_input = 'N'
        expect(input_testing.verify_input(unvalid_input)).to be false
      end

      it 'is falsy when column if full' do
        6.times do 
          input_testing.board.update_board(1, input_testing.board.red_circle)
        end
        expect(input_testing.verify_input(1)).to be false
      end
    end
  end
end
