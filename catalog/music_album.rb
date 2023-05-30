require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :genre, :title, :publish_date

  def initialize(title, on_spotify, genre, publish_date)
    super(genre, author, label, publish_date)
    @on_spotify = on_spotify
    @genre = genre
    @publish_date = publish_date
    @title = title
  end

  def can_be_archived?
    return true if super && @on_spotify == true

    false
  end
end
