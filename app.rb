require './musicalbam'
require './modules/albummodule'
require './genre'
require './modules/datamodule'
require './sideClass/checkfile'
require_relative 'game'
require_relative 'author'
require 'json'
require './sideClass/readfile'
require './modules/hash_data'
    


class App
  include AlbumModule
  include DataModule
  include FileManagement
  def initialize
    check_files
    load_from_files
    @games = []
    @authors = []
    @music_albums = []
    @genres = []
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

  def load_from_files
    @genres = read_genres
    @music_albums = read_music_albums
    @authors = read_authors
    @games = read_games
    puts @games[0]
  end
end
