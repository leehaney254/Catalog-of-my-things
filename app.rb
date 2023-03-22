require './musicalbam'
require './albummodule'
require './genre'
require './datamodule'
require './checkfile'
require 'json'

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
end
