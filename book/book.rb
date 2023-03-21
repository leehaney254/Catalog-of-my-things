require_relative '../item'
require 'date'

class Book < Item
  attr_reader :publisher, :cover_state

  def initialize(publisher, cover_state, publish_date, id)
    super(publish_date, id)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    @cover_state == 'bad' || super
  end
end
