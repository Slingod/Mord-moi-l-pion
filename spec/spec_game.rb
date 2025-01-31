# spec/game_spec.rb
require 'game'
require 'player'

RSpec.describe Game do
  let(:player1) { Player.new('Player 1', 'X') }
  let(:player2) { Player.new('Player 2', 'O') }
  let(:game) { Game.new(player1, player2) }

  describe '#initialize' do
    it 'initializes with two players and a board' do
      expect(game.players).to eq([player1, player2])
      expect(game.board).to be_a(Board)
    end
  end

  describe '#switch_player' do
    it 'switches the current player' do
      game.switch_player
      expect(game.current_player).to eq(player2)
      game.switch_player
      expect(game.current_player).to eq(player1)
    end
  end

  describe '#play_turn' do
    it 'plays a turn and switches players' do
      allow(game).to receive(:gets).and_return('A1')
      expect(game.play_turn).to be false
      expect(game.current_player).to eq(player2)
    end

    it 'ends the game if there is a winner' do
      allow(game).to receive(:gets).and_return('A1', 'A2', 'A3')
      expect(game.play_turn).to be false
      expect(game.play_turn).to be false
      expect(game.play_turn).to be true
    end

    it 'ends the game if the board is full' do
      allow(game).to receive(:gets).and_return('A1', 'A2', 'A3', 'B1', 'B2', 'B3', 'C1', 'C2', 'C3')
      9.times { game.play_turn }
      expect(game.play_turn).to be true
    end
  end
end