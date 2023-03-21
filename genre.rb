class Genre
 def initialize(name)
  @id = rand(1000)
  @name = name
  @items = []
 end

 def add_item(item)
  @items << item
  #item.set_genre(self)
 end
end