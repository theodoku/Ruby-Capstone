require 'json'
require 'date'
require_relative 'item'
require_relative 'label'

class Game < Item
  attr_reader :label
  attr_accessor :multiplayer, :last_played_at, :publish_date

  def initialize(multiplayer, last_played_at, label, publish_date)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @label = label
  end

  def can_be_archived?
    super && (Date.today.year - Date.parse(@last_played_at).year) > 2
  end

  def self.file_path
    './data/games.json'
  end

  def self.get_label(data)
    Label.new(data['label']['title'], data['label']['color'])
  end

  def self.load_all
    return [] unless File.exist?(file_path)

    file_content = File.read(file_path)
    games_data = JSON.parse(file_content)
    games_data.map do |data|
      Game.new(data['multiplayer'], data['last_played_at'], Game.get_label(data), data['publish_date'])
    end
  end

  def self.save_all(games)
    return unless games.any?

    data = games.map do |game|
      {
        multiplayer: game.multiplayer,
        last_played_at: game.last_played_at,
        label: { title: game.label.title, color: game.label.color },
        publish_date: game.publish_date
      }
    end

    File.write(file_path, JSON.pretty_generate(data))
  end

  # private

  # def age_in_years
  #   today = Date.today
  #   Date.new(today.year - 2, today.month, today.day)
  # end
end
