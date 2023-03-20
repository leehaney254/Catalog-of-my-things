class Item
  attr-accessor :genre, :author, :source, :label
  def initialize(genre, author, source, label, publish_date, archived)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = archived
    @id = rand(1000)
    @archived = archived
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
