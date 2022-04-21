# frozen_string_literal: false

require 'player'

describe Player do
  describe '#to_s' do
    it 'should print the name and symbol of the player' do
      player = Player.new('John', 'X')
      expect(player.to_s).to eq('John, X')
    end
  end
end
