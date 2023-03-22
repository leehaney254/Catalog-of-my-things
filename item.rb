require 'date'

class Item
  attr_accessor :genre, :author, :source, :label

  def initialize(publish_date, archived)
    @publish_date = Date.parse(publish_date)
    @archived = archived
    @id = rand(1000)
  end

  def move_to_archive
    @archived = true if can_be_archived? == true
  end

  private

  def can_be_archived?
    @publish_date < Date.today - 3650
  end

  attr_writer :id, :archived
end
