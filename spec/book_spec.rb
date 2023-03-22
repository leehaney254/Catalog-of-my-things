require_relative '../book/book'
require_relative '../item'

describe Book do
  before(:each) do
    @book = Book.new('Jane Doe', '2023-03-21', 'true', 'good')
  end

  context 'when initialized' do
    it 'returns a Book object' do
      expect(@book).to be_an_instance_of Book
    end
  end

  context '#publisher' do
    it 'returns the correct publisher' do
      expect(@book.publisher).to eq('Jane Doe')
    end
  end

  context '#can_be_archived?' do
    it 'returns false when cover state is good' do
      expect(@book.can_be_archived?).to be(true)
    end

    it 'returns true when cover state is good' do
      bad_cover_book = Book.new('Jane Doe', '2023-03-21', 'true', 'good')
      expect(bad_cover_book.can_be_archived?).to be(true)
    end
  end
end
