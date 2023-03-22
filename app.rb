require './musicalbam'
require './module'
require './genre'

class App
  include AlbumModule
  def initialize
    @music_album = []
    @genre = []
  end
end
