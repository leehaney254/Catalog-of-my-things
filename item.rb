class Item
  attr-accessor :genre, :author, :source, :label
  def initialize(genre, author, source, label, publish_date, archived)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = archived

    private
    @id = rand(1000)
    @archived = archived
  end

  def move_to_archive
  end

  private
  def can_be_archived?
  end

end
