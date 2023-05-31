require_relative 'item'

class Genre
  attr_reader :id, :name, :items

  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    return if item_already_added?(item)

    @items << item
  end

  private

  def item_already_added?(item)
    @items.include?(item)
  end
end
