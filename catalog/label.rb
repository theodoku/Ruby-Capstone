class Label
  attr_accessor :text, :color
  attr_reader :item

  def initialize(text, color, item)
    @text = text
    @color = color
    @item = item
  end

  def add_item(item)
    @item = item
    item.label = self
  end

  def already_added(item)
    @items.include?(item)
  end
end
