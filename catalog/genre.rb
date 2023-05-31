class Genre
  attr_reader :items
  
  def initialize
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