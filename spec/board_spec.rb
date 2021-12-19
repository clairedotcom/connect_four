require_relative '../lib/board'
require_relative '../lib/game'

describe Board do
  describe '#update_board' do
    context 'when a move is passed as an argument' do
      subject(:board_update) { described_class.new }

      it 'adds the marker to the column' do
        move = 3
        marker = 'X'
        board_update.update_board(move, marker)
        board = board_update.instance_variable_get(:@board)
        expect(board[move - 1]).to include(marker)
      end
    end
  end

  describe '#column_win?' do
    context 'when empty board is initialized' do
      subject(:board_win) { described_class.new }

      it 'returns false' do
        expect(board_win.column_win?).to be false
      end
    end

    context 'when a player has four markers in the same column' do
      subject(:board_column) { described_class.new }

      before do
        win = Array.new(7) { Array.new(6, ' ') }
        win[1] = ['X', 'X', 'X', 'X', ' ', ' ']
        board_column.instance_variable_set(:@board, win)
      end

      it 'returns true' do
        expect(board_column.column_win?).to be true
      end
    end
  end

  describe '#row_win?' do
    context 'when a player has four markers across four columns' do
      subject(:board_row) { described_class.new }

      before do
        win = Array.new(7) { Array.new(6, ' ') }
        win[0][0] = 'X'
        win[1][0] = 'X'
        win[2][0] = 'X'
        win[3][0] = 'X'
        board_row.instance_variable_set(:@board, win)
      end

      it 'returns true' do
        expect(board_row.row_win?).to be true
      end
    end
  end

  describe '#diagonal_win?' do
    context 'when a player has a diagonal four in a row' do
      subject(:board_diagonal) { described_class.new }

      before do
        win = Array.new(7) { Array.new(6, ' ') }
        win[0][0] = 'X'
        win[1][1] = 'X'
        win[2][2] = 'X'
        win[3][3] = 'X'
        board_diagonal.instance_variable_set(:@board, win)
      end

      it 'returns true' do
        expect(board_diagonal.diagonal_win?).to be true
      end
    end
  end

  describe '#board_full?' do
    subject(:full_board) { described_class.new }

    context 'when all columns are full' do
      before do
        full = Array.new(7) { Array.new(6, 'X') }
        full_board.instance_variable_set(:@board, full)
      end

      it 'returns true' do
        expect(full_board.board_full?).to be true
      end
    end

    subject(:not_full_board) { described_class.new }

    context 'when there are still moves available' do
      before do
        not_full = Array.new(7) { Array.new(6, 'X') }
        not_full[0][4] = ' '
        not_full_board.instance_variable_set(:@board, not_full)
      end

      it 'returns false' do
        expect(not_full_board.board_full?).to be false
      end
    end
  end
end
