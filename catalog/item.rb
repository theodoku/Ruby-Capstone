class Item
  attr_reader :id, :genre, :author, :label, :publish_date

  def initialize(genre, author, label, publish_date)
    @id = Random.rand(1..1000)
    self.genre = genre
    self.author = author
    self.label = label
    @publish_date = publish_date
  end

  def can_be_archived?
    age_in_years >= 10
  end

  def genre=(genre)
    @genre = genre
    genre.add_item(self) unless genre.add_item.include?(self)
  end

  def author=(author)
    @author = author
    author.add_item(self) unless author.add_item.include?(self)
  end

  def label=(label)
    @label = label
    label.add_item(self) unless label.add_item.include?(self)
  end

  def move_to_archive
    can_be_archived?
  end

  private

  def age_in_years
    Time.now.year - @publish_date.year
  end
end
