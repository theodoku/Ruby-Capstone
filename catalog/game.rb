require 'json'
require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :genre, :publish_date

  def initialize(multiplayer, last_played_at, genre, publish_date)
    super(genre, author, label, publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @genre = genre
    @publish_date = publish_date
  end

  def can_be_archived?
    super && age_in_years > 2
  end

  private

  def age_in_years
    Time.now.year - @last_played_at.year
  end

  def self.file_path
    './data/games.json'
  end

  def self.load_all
    return [] unless File.exist?(file_path)

    file_content = File.read(file_path)
    games_data = JSON.parse(file_content)
    games_data.map { |game_data| Game.new(*game_data.values) }
  end

  def self.save_all(games)
    return unless games.any?

    data = games.map do |game|
      {
        multiplayer: game.multiplayer,
        last_played_at: game.last_played_at,
        genre: game.genre,
        publish_date: game.publish_date
      }
    end

    File.write(file_path, JSON.pretty_generate(data))
  end
end
