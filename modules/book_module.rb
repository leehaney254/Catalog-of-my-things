module BookModule
  def add_book
    print 'Who\'s the publisher? : '
    publisher = gets.chomp
    print 'Is the book archived (true/false): '
    archived = gets.chomp
    print 'Is the cover in a good or bad state? : '
    cover_state = gets.chomp
    print 'When was the book published (dd-mm-yyyy)? : '
    publish_date = gets.chomp
    print 'Enter label title for the book: '
    title = gets.chomp
    print 'Enter the color of the label: '
    color = gets.chomp
    books = Book.new(publisher, publish_date, archived, cover_state)
    labels = Label.new(title, color)
    @books << books
    @labels << labels
    write_books
    write_labels
    puts 'You have successfully added a book 😎'
  end

  def list_books
    puts 'You have no books. Check again later👋' if @books.empty?
    @books.each_with_index do |book, index|
      puts "#{index + 1}) Publisher: #{book.publisher} archived: #{book.archived}  cover_state: #{book.cover_state} publish_date:#{book.publish_date}"
    end
    puts
  end

  def list_labels
    puts 'There are no labels to display' if @labels.empty?
    @labels.each_with_index do |label, index|
      puts "#{index + 1}) #{label.title} , #{label.color}"
    end
  end
end
