module AlbumModule
  def add_music_album
    print 'What day was it published(ie 10): '
    date = gets.chomp.to_i
    print 'Is it archived true or true or false: '
    archived = gets.chomp
    print 'Is it on spotify true or false: '
    on_spotify = gets.chomp
    puts 'Album Created succesfully.'
    puts
    music_album = MusicAlbum.new(date, archived: archived, on_spotify: on_spotify)
    @music_album << music_album
  end

  def list_music_album
    @music_album.each_with_index do |album, index|
      puts "#{index}. Publish_date: #{album.publish_date} on_spotify: #{album.on_spotify}"
    end
    puts
  end
  
end