require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :genre, :title, :publish_date

  def initialize(multiplayer, last_played_at, genre, publish_date)
    super(genre, author, label, publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super && last_played_at > 2
  end
end
