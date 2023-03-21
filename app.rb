require './musicalbam'
require './module'

class App
  include AlbumModule
  def initialize
    @music_album = []
  end
end
