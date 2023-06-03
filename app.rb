require_relative './catalog/label'
require_relative './catalog/book'
require_relative './catalog/game'
require_relative './catalog/author'
require_relative './catalog/music_album'
require_relative './catalog/genre'
require_relative './catalog/list'

class App
  attr_reader :labels, :books, :genres, :music_albums, :games, :authors

  def initialize
    @labels = Label.load_collection
    @books = Book.load_collection
    @genres = Genre.load_all
    @music_albums = MusicAlbum.load_all
    @games = Game.load_all
    @authors = Author.load_all
    @list = List.new
  end

  def list_labels
    @labels = Label.load_collection
    @list.label_list(@labels)
  end

  def list_books
    @books = Book.load_collection
    @list.book_list(@books)
  end

  def list_all_music_albums
    @music_albums = MusicAlbum.load_all
    @list.music_album_list(@music_albums)
  end

  def list_all_genres
    @genres = Genre.load_all
    @list.genre_list(@genres)
  end

  def list_games
    @games = Game.load_all
    @list.game_list(@games)
  end

  def list_authors
    @authors = Author.load_all
    @list.author_list(@authors)
  end

  def add_book
    puts 'Enter book title:'
    title = gets.chomp
    puts 'Enter publisher:'
    publisher = gets.chomp
    puts 'Enter cover state (good/bad):'
    cover_state = gets.chomp.downcase == 'bad' ? 'bad' : 'good'
    puts 'Enter publish date (yyyy-mm-dd):'
    publish_date = gets.chomp
    author = select_author
    @books = Book.load_collection
    book = Book.new(title, publisher, cover_state, author, publish_date)
    book.add_author = (author)
    @books << book
    puts 'Book has been created successfully! :white_check_mark:'
    Book.save_collection(@books)
  end

  def add_label
    puts 'Enter label title:'
    title = gets.chomp
    puts 'Enter label color:'
    color = gets.chomp
    @labels = Label.load_collection
    label = Label.new(title, color)
    @labels << label
    Label.save_collection(@labels)
    label
  end

  def select_author
    puts "\nAdd the author information"
    puts 'First Name: '
    first_name = gets.chomp.to_s
    puts 'Last Name: '
    last_name = gets.chomp.to_s
    author = Author.new(first_name, last_name)
    @authors = Author.load_all
    @authors << author
    Author.save_all(@authors)
    author
  end

  def multiplayer_status
    puts 'Multiplayer? (Y/N): '
    multiplayer = gets.chomp.downcase
    case multiplayer
    when 'y'
      true
    when 'n'
      false
    else
      puts "Invalid value detected: #{multiplayer}"
    end
  end

  def add_game
    puts 'Publish Date: '
    publish_date = gets.chomp
    puts 'Select label: '
    label = add_label
    puts 'Date last played: '
    last_played = gets.chomp
    is_multiplayer = multiplayer_status
    new_game = Game.new(is_multiplayer, last_played, label, publish_date)
    new_game.add_label = (label)
    @games = Game.load_all
    @games << new_game
    Game.save_all(@games)
    puts 'Game has been created successfully! :white_check_mark:'
  end

  def add_genre(name)
    genre = Genre.new(name)
    @genres = Genre.load_all
    @genres << genre
    Genre.save_all(@genres)
    genre
  end

  def add_music_album
    puts 'Enter music album title:'
    title = gets.chomp
    puts 'Enter music album spotify status (true/false):'
    on_spotify = gets.chomp.downcase == 'true'
    puts 'Enter music album publish date (yyyy-mm-dd):'
    publish_date = gets.chomp
    puts 'Enter music album genre name:'
    genre_name = gets.chomp
    genre = add_genre(genre_name)
    music_album = MusicAlbum.new(title, on_spotify, genre, publish_date)
    music_album.add_genre = (genre)
    @music_albums = MusicAlbum.load_all
    @music_albums << music_album
    MusicAlbum.save_all(@music_albums)
    puts 'Music album has been created successfully! :white_check_mark:'
  end

  def close_app
    puts 'Thanks for using the app!'
  end
end
