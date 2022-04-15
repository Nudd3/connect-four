# frozen_string_literal: false

require 'board'

describe Board do
  describe '#update_board' do
    context 'when updating the first row and the first column with a symbol' do
      it 'updates the cell on the board'
    end

    context 'when updating the last row and the last column with a symbol' do
      it 'updates the cell on the board'
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
