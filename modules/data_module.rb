module DataModule
  def check_files
    files = %w[books labels]
    files.each do |file|
      unless File.exist?("./storage_files/#{file}.json")
        File.new("./storage_files/#{file}.json", 'w')
        File.write("./storage_files/#{file}.json", [])
      end
    end
  end

  def save_to_files
    hashes = [books_hash, labels_hash]
    files = %w[books labels]
    hashes.each_with_index do |hash, index|
      File.write("./storage_files/#{files[index]}.json", hash.to_json)
    end
  end

  def read_data(file)
    return [] unless File.exist?(file)

    file_check = File.open(file)
    file_data = file_check.read
    file_check.close
    JSON.parse(file_data)
  end

  def saved_data(arr, filename)
    new_file = CheckFile.new
    json = JSON.generate(arr)
    store_file = new_file.check_file(filename, 'w')
    store_file.write(json)
    store_file.close
  end

  def books_hash
    @books.map do |book|
      {
        publisher: book.publisher,
        cover_state: book.cover_state,
        archived: book.archived,
        publish_date: book.publish_date
      }
    end
  end

  def labels_hash
    @labels.map do |label|
      {
        title: label.title,
        color: label.color
      }
    end
  end

  def read_books
    books_raw = JSON.parse(File.read('storage_files/books.json'))
    books_raw.map do |book|
      Book.new(book['publisher'], book['publish_date'], book['archived'], book['cover_state'])
    end
  end

  def read_labels
    labels_raw = JSON.parse(File.read('storage_files/labels.json'))
    labels_raw.map do |label|
      Label.new(label['title'], label['color'])
    end
  end

  def write_authors
    File.write('storage_files/authors.json', authors_hash.to_json)
  end

  def write_genre
    File.write('storage_files/genre.json', genre_hash.to_json)
  end

  def write_books
    File.write('storage_files/books.json', books_hash.to_json)
  end

  def write_labels
    File.write('storage_files/labels.json', labels_hash.to_json)
  end
end
