# frozen_string_literal: false

# rubocop:disable Metrics/BlockLength

require 'board'

describe Board do
  describe '#update_board' do
    context 'When updating the first column one time' do
      subject(:board) { described_class.new }
      it 'updates the cell on the board' do
        board.update_board(1, 'X')
        expect(board.board[5][0]).to eq('X')
      end
    end

    context 'when updating the last row and the last column with a symbol' do
      it 'updates the cell on the board'
    end

    context 'when argument is no a number' do
      it 'is falsy'
    end

    context 'when argument is outside bounds' do
      it 'is falsy'
    end

    context 'when column is full' do
      it 'is falsy'
    end
  end

  describe '#winner?' do
    context 'when a player wins horizontally' do
      it 'puts the winner message'
    end

    context 'when a player wins vertically' do
      it 'puts the winner message'
    end

    context 'when a player wins diagonally going left' do
      it 'puts the winner message'
    end

    context 'when a player wins diagonally going right' do
      it 'puts the winner message'
    end
  end
end
# rubocop:enable Metrics/BlockLength
