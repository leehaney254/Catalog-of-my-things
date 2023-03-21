require_relative 'game'
require_relative 'author'
require 'json'

class App
  def initialize
    check_files
    games, authors = load_from_files
    @games = games
    @authors = authors
  end

  def create_game
    puts 'Enter the name of the game'
    name = gets.chomp
    puts 'Enter the publish date of the game'
    publish_date = gets.chomp
    puts 'Enter the archived status of the game'
    archived = gets.chomp
    puts 'Enter the multiplayer status of the game'
    multiplayer = gets.chomp
    game = Game.new(name, publish_date, archived, multiplayer)
    @games << game
  end

  def create_author
    puts 'Enter the first name of the author'
    first_name = gets.chomp
    puts 'Enter the last name of the author'
    last_name = gets.chomp
    author = Author.new(first_name, last_name)
    @authors << author
  end

  def list_games
    @games.each do |game|
      puts "Name: #{game.name} - Multiplayer: #{game.multiplayer}"
    end
  end

  def list_authors
    @authors.each do |author|
      puts "First name: #{author.first_name} - Last name: #{author.last_name}"
    end
  end

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

  def load_from_files
    games_raw = JSON.parse(File.read('storage_files/games.json'))
    authors_raw = JSON.parse(File.read('storage_files/authors.json'))
    games = games_raw.map do |game|
      Game.new(game['name'], game['publish_date'], game['archived'], game['multiplayer'])
    end
    authors = authors_raw.map do |author|
      Author.new(author['first_name'], author['last_name'])
    end
    [games, authors]
  end
end
