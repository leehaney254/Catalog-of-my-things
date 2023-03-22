require 'securerandom'

class Author
  attr_accessor :first_name, :last_name

  def initialize(first_name, last_name)
    @id = generate_id
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    item.author = self
    @items << item
  end

  private

  def generate_id
    SecureRandom.uuid
  end

  attr_writer :id, :items
end
