require_relative '../lib/tic_tac_toe'

describe Game do
  subject(:game) { described_class.new }

  describe '#run' do
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

  describe '#play' do
    it 'plays three rounds when #over? is false, false, false, true' do
      allow(game).to receive(:over?).and_return(false, false, false, true)
      allow(game).to receive(:display_end_screen)
      expect(game).to receive(:play_round).exactly(3).times
      game.play
    end

    it 'stops when game is over' do
      allow(game).to receive(:over?).and_return(true)
      allow(game).to receive(:display_end_screen)
      expect(game).not_to receive(:play_round)
      game.play
    end

    it 'displays game end message' do
      allow(game).to receive(:over?).and_return(true)
      allow(game).to receive(:display_end_screen)
      expect(game).to receive(:display_end_screen)
      game.play
    end
  end

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
