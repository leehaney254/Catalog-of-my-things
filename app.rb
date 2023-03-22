require './musicalbam'
require './module/albummodule'
require './genre'
require './module/datamodule'
require './sideClass/checkfile'
require 'json'
require './sideClass/readfile'

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
