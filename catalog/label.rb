class Label
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    if !@items.include?(item)
      @items.push(item)
    end
  end
end
