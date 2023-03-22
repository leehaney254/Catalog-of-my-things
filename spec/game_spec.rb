require_relative '../game'
require_relative '../item'

describe Game do
  describe '#initialize' do
    it 'initializes the game with a name, publish date, archived status and multiplayer status' do
      game = Game.new('Super Mario Bros.', 1985, false, true)
      expect(game.name).to eq('Super Mario Bros.')
      expect(game.publish_date).to eq(1985)
      expect(game.archived).to eq(false)
      expect(game.multiplayer).to eq(true)
    end
  end

  describe '#play' do
    it 'sets the last played at date to the date passed' do
      game = Game.new('Super Mario Bros.', 1985, false, true)
      game.play(Time.new(2010, 1, 1))
      expect(game.last_played_at).to eq(Time.new(2010, 1, 1))
    end
  end

  describe '#can_be_archived' do
    it 'sets the archived status to true if the game has not been played in 2 years' do
      game = Game.new('Super Mario Bros.', 1985, false, true)
      game.play(Time.new(2010, 1, 1))
      game.move_to_archive
      expect(game.archived).to eq(true)
    end

    it 'sets the archived status to false if the game has been played in the last 2 years' do
      game = Game.new('Super Mario Bros.', 1985, false, true)
      game.play(Time.now)
      game.move_to_archive
      expect(game.archived).to eq(false)
    end
  end
end
