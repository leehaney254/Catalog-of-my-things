require_relative '../book/book'
require_relative '../book/label'

describe 'Label class' do
  before do
    @book = Book.new('Jane Doe', 'good', '2023-03-21', 1)
    @label = Label.new(1, 'new', 'green')
  end

  it 'Has an item' do
    @label.add_item(@book)
    expect(@label.items[0]).to be(@book)
  end
end
