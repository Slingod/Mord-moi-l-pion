# spec/board_spec.rb
require 'spec_helper'
require 'board'

RSpec.describe Board do
  let(:board) { Board.new }

  describe '#initialize' do
    it 'creates a board with 9 cases' do
      expect(board.cases.size).to eq(9)
    end
  end

  describe '#display' do
    it 'displays the board' do
      expect { board.display }.to output(/  1 2 3\nA  \nB  \nC  \n/).to_stdout
    end
  end

  describe '#update_case' do
    it 'updates the content of a case' do
      board.update_case('A1', 'X')
      expect(board.cases['A1'].content).to eq('X')
    end
  end

  describe '#full?' do
    it 'returns true if all cases are filled' do
      board.cases.each { |_, case| case.content = 'X' }
      expect(board.full?).to be true
    end

    it 'returns false if any case is empty' do
      expect(board.full?).to be false
    end
  end

  describe '#winner?' do
    it 'returns true if there is a winner' do
      board.update_case('A1', 'X')
      board.update_case('A2', 'X')
      board.update_case('A3', 'X')
      expect(board.winner?).to be true
    end

    it 'returns false if there is no winner' do
      expect(board.winner?).to be false
    end
  end
end