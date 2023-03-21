class Item
  attr_accessor :genre, :author, :source, :label

  def initialize(publish_date, archived)
    @publish_date = publish_date
    @archived = archived
    @id = rand(1000)
  end

  def move_to_archive
    @archived = true if can_be_archived? == true
  end

  private

  def can_be_archived?
    return true if @publish_date > 10

    false
  end

  attr_wrtiter :id, :archived
end
