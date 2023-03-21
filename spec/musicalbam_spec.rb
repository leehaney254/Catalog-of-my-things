require 'spec_helper'

describe MusicAlbum do
  before :each do
    @music_album = MusicAlbum.new('21/03/2023', true ,on_spotify: true)
  end

  context 'When creatinga music album' do
    it 'Should create a new object' do
      expect(@music_album).to be_an_instance_of MusicAlbum
    end
  end
end
