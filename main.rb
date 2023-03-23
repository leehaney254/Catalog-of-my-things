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
      puts
    when 3
      puts 'List of games'
      app.list_games
      puts
    when 4
      app.list_genre
      puts
    when 5
      app.list_labels
      puts
    when 6
      puts 'List all authors (e.g. \'Stephen King\')'
      app.list_authors
      puts
    when 7
      app.add_book
      puts
    when 8
      app.add_music_album
    when 9
      puts 'Add a game'
      app.create_game
    when 10
      app.save_to_files
      puts 'Thank you for using this App👋❌'
      exit
    else
      puts 'Please select an option between 1 and 10'
    end
  end
end

def menu
  puts 'Select a number'
  list = {
    1 => 'List all books',
    2 => 'List all music albums',
    3 => 'List of games',
    4 => 'List all genres (e.g \'Comedy\', \'Thriller\')',
    5 => 'List all labels (e.g. \'Gift\', \'New\')',
    6 => 'List all authors (e.g. \'Stephen King\')',
    7 => 'Add a book',
    8 => 'Add a music album',
    9 => 'Add a game',
    10 => 'Exit App'
  }
  list.each do |index, string|
    puts "#{index} - #{string}"
  end
  gets.chomp.to_i
end

app = App.new
main(app)
