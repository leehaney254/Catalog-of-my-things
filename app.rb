require './book/book'
require './book/label'
require './modules/book_module'
require './modules/data_module'
require 'json'

class App
  include BookModule
  include DataModule
  def initialize
    check_files
    @books = read_books
    @labels = read_labels
  end
end
