require 'item.rb'

class MusicAlbum < Item
  def initialize(on_spotify: false)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    true if super && @on_spotify 

    false
end