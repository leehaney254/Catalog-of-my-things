class Item
  attr_accessor :genre, :author, :source, :label, :publish_date
  attr_accessor :genre, :author, :source, :label, :publish_date

  def initialize(publish_date, archived)
    @publish_date = publish_date
    @archived = archived
    @id = Random.rand(1..1000)
    @id = Random.rand(1..1000)
  end

  def move_to_archive
    @archived = true if can_be_archived? == true
    @archived
  end

  private

  def can_be_archived?
    return true if @publish_date.to_i > 10

    false
  end


  attr_reader :id, :archived
end
