# frozen_string_literal: false

# rubocop:disable Metrics/BlockLength

require 'board'

describe Board do
  describe '#update_board' do
    context 'When playing in the first column' do
      subject(:board) { described_class.new }
      it 'updates the cell on the board' do
        board.update_board(1, 'X')
        expect(board.board[5][0]).to eq('X')
      end
    end

    context 'when playing the last column' do
      subject(:board) { described_class.new }
      it 'updates the cell on the board' do
        board.update_board(7, 'X')
        expect(board.board[5][6]).to eq('X')
      end
    end

    context 'when column is full' do
      subject(:board) { described_class.new }

      it 'is falsy' do
        6.times { board.update_board(1, 'X') }
        expect(board.update_board(1, 'X')).to be_falsy
      end
    end
  end

  describe '#full_column?' do
    context 'when a column has been played X amount of times' do
      subject(:board) { described_class.new }

      it 'is truthy when X = 6 times' do
        6.times { board.update_board(1, 'X') }
        expect(board.full_column?(1)).to be_truthy
      end

      it 'is falsy when X = 3 times' do
        3.times { board.update_board(2, 'X') }
        expect(board.full_column?(2)).to be_falsy
      end
    end
  end

  describe '#full_board?' do
    subject(:board) { described_class.new }
    it 'is falsy when board is not full' do
      expect(board.full_board?).to be_falsy
    end

    it 'is truthy when board is full' do
      6.times do
        board.update_board(1, 'X')
        board.update_board(2, 'X')
        board.update_board(3, 'X')
        board.update_board(4, 'X')
        board.update_board(5, 'X')
        board.update_board(6, 'X')
        board.update_board(7, 'X')
      end
      expect(board.full_board?).to be_truthy
    end
  end

  describe '#winner?' do
    subject(:winner_board) { described_class.new }

    context 'when a player wins horizontally' do
      it 'is truthy' do
        winner_board.update_board(3, 'X')
        winner_board.update_board(4, 'X')
        winner_board.update_board(5, 'X')
        winner_board.update_board(6, 'X')
        expect(winner_board.winner?).to be_truthy
      end
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
