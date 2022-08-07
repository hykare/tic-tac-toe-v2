require_relative '../lib/tic_tac_toe'

describe Game do
  describe '#run' do
    subject(:game) { described_class.new }

    before do
      allow(game).to receive(:play)
    end

    it 'plays game once when play_again is false' do
      allow(game).to receive(:play_again?).and_return(false)
      expect(game).to receive(:play).once
      game.run
    end

    it 'plays game twice when play_again is true, then false' do
      allow(game).to receive(:play_again?).and_return(true, false)
      expect(game).to receive(:play).twice
      game.run
    end
  end

  describe '#play'
  describe '#play_round'
  describe '#switch_player'
  describe '#validate_input'
  describe '#over?'
  describe '#play_again?'
  describe '#display_end_screen'
  describe '#reset'
end

describe GameBoard do
  describe '#draw'
  describe '#update'
end
