module DataModule
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

  def genre_hash
    new_array = []
    @genres.each do |item|
      hash_genre = {
        'name' => item.name
      }
      new_array << hash_genre
    end
    saved_data(new_array, './storage_files/genre.json')
  end

  def music_album_hash
    new_array = []
    @music_albums.each do |item|
      hash_music_album = {
        'publish_date' => item.publish_date,
        'archive' => item.move_to_archive,
        'on_spotify' => item.on_spotify
      }
      new_array << hash_music_album
    end
    saved_data(new_array, './storage_files/musicAlbam.json')
  end

  def read_genres
    new_array = []
    people_data = ReadData.new
    json_genre = people_data.read_data('./storage_files/genre.json')
    json_genre.each do |item|
      new_array << Genre.new(item['name'])
    end
    new_array
  end

  def read_music_albums
    new_array = []
    people_data = ReadData.new
    json_music = people_data.read_data('./storage_files/musicAlbam.json')
    json_music.each do |item|
      new_array << MusicAlbum.new(item['publish_date'], archived: item['archive'], on_spotify: item['on_spotify'])
    end
   new_array
  end

  def read_games
    games_raw = JSON.parse(File.read('storage_files/games.json'))
    puts games_raw
    games = games_raw.map do |game|
      Game.new(game['name'], game['publish_date'], game['archived'], game['multiplayer'])
    end
   puts games
  end

  def read_authors
    authors_raw = JSON.parse(File.read('storage_files/authors.json'))
    authors = authors_raw.map do |author|
      Author.new(author['first_name'], author['last_name'])
    end
    authors
  end
end
