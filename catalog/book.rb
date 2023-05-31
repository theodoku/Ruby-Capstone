require 'json'

class Book
  attr_accessor :title, :author, :publisher

  def initialize(cover_state, publisher)
    @cover_state = cover_state
    @publisher = publisher
  end

  def can_be_archived?
    @cover_state == 'bad'
  end

  def self.load_collection(file_path)
    json_data = File.read(file_path)
    books_data = JSON.parse(json_data, symbolize_names: true)
    books_data.map { |book_data| from_json(book_data) }
  end

  def self.save_collection(books, file_path)
    books_data = books.map(&:to_json)
    json_data = JSON.generate(books_data)
    File.write(file_path, json_data)
  end

  def to_json
    {
      title: @title,
      author: @author,
      publisher: @publisher,
      cover_state: @cover_state
    }
  end

  def self.from_json(data)
    new(data[:cover_state], data[:publisher]).tap do |book|
      book.title = data[:title]
      book.author = data[:author]
    end
  end
end
