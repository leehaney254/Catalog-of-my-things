require 'spec_helper'

describe Genre do
  before :each do
    @genre = Genre.new('Action')
  end

  context 'When creatinga music album' do
    it 'Should create a new object' do
      expect(@genre).to be_an_instance_of Genre
    end

    it 'Should return the name action' do
      expect(@genre.name).to eq 'Action'
    end

    it 'Should add an item' do
      item = Item.new(20, false)
      expect(@genre.add_item(item).length).to eq 1
    end
  end
end
