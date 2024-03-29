# frozen_string_literal: false

# rubocop:disable Metrics/BlockLength

require 'board'
require 'miscellaneous'
describe Board do
  let(:red_circle) { described_class.new.red_circle }

  describe '#update_board' do
    context 'When playing in the first column' do
      subject(:board) { described_class.new }
      it 'updates the cell on the board' do
        board.update_board(1, red_circle)
        expect(board.board[5][0]).to eq(red_circle)
      end
    end

    context 'when playing the last column' do
      subject(:board) { described_class.new }
      it 'updates the cell on the board' do
        board.update_board(7, red_circle)
        expect(board.board[5][6]).to eq(red_circle)
      end
    end

    context 'when column is full' do
      subject(:board) { described_class.new }

      it 'is falsy' do
        6.times { board.update_board(1, red_circle) }
        expect(board.update_board(1, red_circle)).to be_falsy
      end
    end
  end

  describe '#full_column?' do
    context 'when a column has been played X amount of times' do
      subject(:board) { described_class.new }

      it 'is truthy when X = 6 times' do
        6.times { board.update_board(1, red_circle) }
        expect(board.full_column?(1)).to be_truthy
      end

      it 'is falsy when X = 3 times' do
        3.times { board.update_board(2, red_circle) }
        expect(board.full_column?(2)).to be_falsy
      end
    end
  end

  describe '#full_board?' do
    subject(:board) { described_class.new }
    it 'is falsy when board is not full' do
      board.print_board
      expect(board.full_board?).to be_falsy
    end

    it 'is truthy when board is full' do
      6.times do
        board.update_board(1, red_circle)
        board.update_board(2, red_circle)
        board.update_board(3, red_circle)
        board.update_board(4, red_circle)
        board.update_board(5, red_circle)
        board.update_board(6, red_circle)
        board.update_board(7, red_circle)
      end
      expect(board.full_board?).to be_truthy
    end
  end

  describe '#winner?' do
    subject(:winner_board) { described_class.new }

    context 'when a player wins horizontally' do
      it 'is truthy' do
        winner_board.update_board(3, red_circle)
        winner_board.update_board(4, red_circle)
        winner_board.update_board(5, red_circle)
        winner_board.update_board(6, red_circle)
        expect(winner_board.winner?(red_circle)).to be_truthy
      end
    end

    context 'when a player wins vertically' do
      it 'is truthy' do
        winner_board.update_board(1, red_circle)
        winner_board.update_board(1, red_circle)
        winner_board.update_board(1, red_circle)
        winner_board.update_board(1, red_circle)
        expect(winner_board.winner?(red_circle)).to be_truthy
      end
    end

    context 'when a player wins diagonally going down left from top right' do
      it 'is truthy' do
        winner_board.board[0][6] = red_circle
        winner_board.board[1][5] = red_circle
        winner_board.board[2][4] = red_circle
        winner_board.board[3][3] = red_circle
        expect(winner_board.winner?(red_circle)).to be_truthy
      end
    end

    context 'when a player wins diagonally going up left from bottom right' do
      it 'is truthy' do
        winner_board.board[5][6] = red_circle
        winner_board.board[4][5] = red_circle
        winner_board.board[3][4] = red_circle
        winner_board.board[2][3] = red_circle
        expect(winner_board.winner?(red_circle)).to be_truthy
      end
    end

    context 'when a player wins diagonally going up left from middle' do
      it 'is truthy' do
        winner_board.board[3][3] = red_circle
        winner_board.board[2][2] = red_circle
        winner_board.board[1][1] = red_circle
        winner_board.board[0][0] = red_circle
        expect(winner_board.winner?(red_circle)).to be_truthy
      end
    end

    context 'when a player wins diagonally going down left from middle' do
      it 'is truthy' do
        winner_board.board[2][3] = red_circle
        winner_board.board[3][2] = red_circle
        winner_board.board[4][1] = red_circle
        winner_board.board[5][0] = red_circle
        expect(winner_board.winner?(red_circle)).to be_truthy
      end
    end

    context 'when a player wins diagonally going down right from top left' do
      it 'is truthy' do
        winner_board.board[0][0] = red_circle
        winner_board.board[1][1] = red_circle
        winner_board.board[2][2] = red_circle
        winner_board.board[3][3] = red_circle
        expect(winner_board.winner?(red_circle)).to be_truthy
      end
    end

    context 'when a player wins diagonally going up right from bottom left' do
      it 'is truthy' do
        winner_board.board[5][0] = red_circle
        winner_board.board[4][1] = red_circle
        winner_board.board[3][2] = red_circle
        winner_board.board[2][3] = red_circle
        expect(winner_board.winner?(red_circle)).to be_truthy
      end
    end

    context 'when a player wins diagonally going up right from middle' do
      it 'is truthy' do
        winner_board.board[3][3] = red_circle
        winner_board.board[2][4] = red_circle
        winner_board.board[1][5] = red_circle
        winner_board.board[0][6] = red_circle
        expect(winner_board.winner?(red_circle)).to be_truthy
      end
    end

    context 'when a player wins diagonally going down right from middle' do
      it 'is truthy' do
        winner_board.board[2][3] = red_circle
        winner_board.board[3][4] = red_circle
        winner_board.board[4][5] = red_circle
        winner_board.board[5][6] = red_circle
        expect(winner_board.winner?(red_circle)).to be_truthy
      end
    end

    context 'when there is no winner' do
      it 'is falsy' do
        expect(winner_board.winner?(red_circle)).to be_falsy
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
