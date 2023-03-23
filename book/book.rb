require_relative '../item'
require 'date'
require 'securerandom'

class Book < Item
  attr_reader :publisher, :publish_date, :archived, :cover_state

  def initialize(publisher, publish_date, archived, cover_state)
    super(publish_date, id)
    @id = SecureRandom.uuid
    @publisher = publisher
    @publish_date = publish_date
    @archived = archived
    @cover_state = cover_state
  end

  def can_be_archived?
    @cover_state == 'bad' || super
  end
end
