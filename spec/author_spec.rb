require_relative '../author'
require_relative '../item'

describe Author do
  describe '#initialize' do
    it 'initializes the author with a first name and a last name' do
      author = Author.new('John', 'Doe')
      expect(author.first_name).to eq('John')
      expect(author.last_name).to eq('Doe')
    end
  end

  describe '#add_item' do
    it 'adds an item to the author' do
      author = Author.new('John', 'Doe')
      item = Item.new(1985, false)
      author.add_item(item)
      expect(item.author.first_name).to eq(author.first_name)
    end
  end
end
