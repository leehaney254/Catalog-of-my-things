require_relative 'item'

class Game < Item
  attr_accessor :name, :publish_date, :archived, :multiplayer, :last_played_at

  def initialize(name, publish_date, archived, multiplayer)
    super(publish_date, archived)
    @multiplayer = multiplayer
    @last_played_at = nil
    @name = name
    @id = rand(1000)
  end

  def play(date = nil)
    @last_played_at = if date.nil?
                        Time.now
                      else
                        date
                      end
  end

  private

  def can_be_archived?
    return true if super && Time.now - @last_played_at > 63_072_000

    false
  end
end
