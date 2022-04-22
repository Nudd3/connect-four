# frozen_string_literal: false

# rubocop:disable Metrics/BlockLength

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
    subject(:turn_testing) { described_class.new }
    let(:player1) { turn_testing.instance_variable_get(:@player1) }
    let(:player2) { turn_testing.instance_variable_get(:@player2) }

    before do
      player1.name = 'John'
      player2.name = 'Jane'
    end

    context 'after each play the turn swaps' do
      it 'is player1 before first play' do
        current_player = turn_testing.player_turn
        expect(current_player.name).to eq(player1.name)
      end

      it 'is player2 after first play' do
        turn_testing.instance_variable_set(:@turn, 1)
        current_player = turn_testing.player_turn
        expect(current_player.name).to eq(player2.name)
      end
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
# rubocop:enable Metrics/BlockLength
