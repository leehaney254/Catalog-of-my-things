require './app'

def main(app)
  puts 'This a catalog of my things'
  puts

  loop do
    case menu
    when 1
      app.list_books
      puts
    when 2
      app.list_music_album
    when 3
      puts 'List all movies'
      puts
    when 4
      puts 'List of games'
      app.list_games
    when 5
      app.list_genre
      puts
    when 6
      app.list_labels
      puts
    when 7
      puts 'List all authors (e.g. \'Stephen King\')'
      app.list_authors
    when 8
      puts 'List all sources (e.g. \'From a friend\', \'Online shop\')'
      puts
    when 9
      app.add_book
      puts
    when 10
      app.add_music_album
    when 11
      puts 'Add a movie'
      puts
    when 12
      puts 'Add a game'
      app.create_game
    when 13
      app.save_to_files
      puts 'Thank you for using this App👋❌'
      exit
    else
      puts 'Please select an option between 1 and 13'
    end
  end
end

def menu
  puts 'Select a number'
  list = {
    1 => 'List all books',
    2 => 'List all music albums',
    3 => 'List all movies',
    4 => 'List of games',
    5 => 'List all genres (e.g \'Comedy\', \'Thriller\')',
    6 => 'List all labels (e.g. \'Gift\', \'New\')',
    7 => 'List all authors (e.g. \'Stephen King\')',
    8 => 'List all sources (e.g. \'From a friend\', \'Online shop\')',
    9 => 'Add a book',
    10 => 'Add a music album',
    11 => 'Add a movie',
    12 => 'Add a game',
    13 => 'Exit App'
  }
  list.each do |index, string|
    puts "#{index} - #{string}"
  end
  gets.chomp.to_i
end

app = App.new
main(app)
