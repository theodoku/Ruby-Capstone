require_relative 'item'

class Genre
  attr_reader :id, :name, :items
  
  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
  @items = []
  end
  
  def add_item(item)
  unless item_already_added?(item)
  @items << item
  end
  end
  
  private
  
  def item_already_added?(item)
  @items.include?(item)
  end
  end