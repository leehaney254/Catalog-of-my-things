class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state, publish_date, id)
    super(publish_date, id)
    @publisher = publisher
    @cover_state = cover_state
  end
end
 