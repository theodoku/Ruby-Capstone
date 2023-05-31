class Label
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items.push(item) unless @items.include?(item)
  end
end
