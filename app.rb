require './musicalbam'
require './albummodule'
require './genre'
require './datamodule'
require './checkfile'
require 'json'
require './readfile'

class App
  include AlbumModule
  include DataModule
  def initialize
    @music_album = []
    @genre = []
  end

  def exit_app
    genre_hash
    music_album_hash
  end

  def fetch_data
    read_genre
    read_music_album
  end
end
