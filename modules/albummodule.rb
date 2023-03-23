module AlbumModule
  def add_music_album
    print 'What day was it published [dd-mm-yyyy]: '
    date = gets.chomp
    print 'Is it archived true or false: '
    archived = gets.chomp
    print 'Is it on spotify true or false: '
    on_spotify = gets.chomp
    music_album = MusicAlbum.new(date, archived: archived, on_spotify: on_spotify)
    create_author
    add_label
    add_genre
    @music_albums << music_album
    puts 'Album Created succesfully.'
    puts
  end

  def add_genre
    print 'Enter the genre(e.g \'Comedy\', \'Thriller\'): '
    genre = gets.chomp
    genre_album = Genre.new(genre)
    @genres << genre_album
    # write_genre
  end

  def list_music_album
    puts 'There are no album to list' if @music_albums.empty?
    @music_albums.each_with_index do |album, index|
      puts "#{index}. Publish_date: #{album.publish_date} archived: #{album.move_to_archive} on_spotify: #{album.on_spotify}"
    end
    puts
  end

  def list_genre
    puts 'There are no genres to list' if @genres.empty?
    @genres.each_with_index do |one_genre, index|
      puts "#{index}. #{one_genre.name}"
    end
  end
end
