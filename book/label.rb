class Label
  attr_accessor :title, :color
  attr_reader :items, :id

  def initialize(id, title, color)
    @id = id
    @title = title
    @color = color
    @items = []
  end
end
