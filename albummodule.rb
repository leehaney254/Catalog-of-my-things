module AlbumModule
  def add_music_album
    print 'What day was it published(ie 10): '
    date = gets.chomp.to_i
    print 'Is it archived true or true or false: '
    archived = gets.chomp
    print 'Is it on spotify true or false: '
    on_spotify = gets.chomp
    print 'Enter the album genre(e.g \'Comedy\', \'Thriller\'): '
    genre = gets.chomp
    music_album = MusicAlbum.new(date, archived: archived, on_spotify: on_spotify)
    genre_album = Genre.new(genre)
    @music_album << music_album
    @genre << genre_album
    puts 'Album Created succesfully.'
    puts
  end

  def list_music_album
    puts 'There are no album to list' if @music_album.empty?
    @music_album.each_with_index do |album, index|
      puts "#{index}. Publish_date: #{album.publish_date} archived: #{album.move_to_archive} on_spotify: #{album.on_spotify}"
    end
    puts
  end

  def list_genre
    puts 'There are no genres to list' if @genre.empty?
    @genre.each_with_index do |one_genre, index|
      puts "#{index}. #{one_genre.name}"
    end
  end
end
