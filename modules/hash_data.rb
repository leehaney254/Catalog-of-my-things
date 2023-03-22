module FileManagement
  def check_files
    files = %w[games authors]
    files.each do |file|
      unless File.exist?("storage_files/#{file}.json")
        File.new("storage_files/#{file}.json", 'w')
        File.write("storage_files/#{file}.json", [])
      end
    end
  end

  def save_to_files
    genre_hash
    music_album_hash
    games = @games.map do |game|
      {
        name: game.name,
        publish_date: game.publish_date,
        archived: game.archived,
        multiplayer: game.multiplayer
      }
    end
    authors = @authors.map do |author|
      {
        first_name: author.first_name,
        last_name: author.last_name
      }
    end
    File.write('storage_files/games.json', games.to_json)
    File.write('storage_files/authors.json', authors.to_json)
  end
end