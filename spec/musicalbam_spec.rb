require 'spec_helper'

describe MusicAlbum do
  before :each do
    @music_album = MusicAlbum.new(15, archived: true, on_spotify: true)
  end

  context 'When creatinga music album' do
    it 'Should create a new object' do
      expect(@music_album).to be_an_instance_of MusicAlbum
    end

    it 'should return true' do
      expect(@music_album.on_spotify).to eq true
    end
  end
end
