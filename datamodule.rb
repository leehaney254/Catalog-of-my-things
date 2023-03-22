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
    @genre.each do |item|
      hash_genre = {
        'name' => item.name
      }
      new_array << hash_genre
    end
    saved_data(new_array, 'genre.json')
  end

  def music_album_hash
    new_array = []
    @music_album.each do |item|
      hash_music_album = {
        'publish_date' => item.publish_date,
        'archive' => item.move_to_archive,
        'on_spotify' => item.on_spotify
      }
      new_array << hash_music_album
    end
    saved_data(new_array, 'musicAlbam.json')
  end

  def read_genre
    new_array = []
    people_data = ReadData.new
    json_genre = people_data.read_data('genre.json')
    json_genre.each do |item|
      new_array << Genre.new(item['name'])
    end
    @genre = new_array
  end

  def read_music_album
    new_array = []
    people_data = ReadData.new
    json_music = people_data.read_data('musicAlbam.json')
    json_music.each do |item|
      new_array << MusicAlbum.new(item['publish_date'], archived: item['archive'], on_spotify: item['on_spotify'])
    end
    @music_album = new_array
  end
end
