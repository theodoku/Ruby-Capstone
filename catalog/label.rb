require 'json'

class Label
  attr_accessor :title, :color
  attr_reader :item

  def initialize(title, color, item)
    @title = title
    @color = color
    @item = item
    @items = []
  end

  def add_item(item)
    @item = item
    item.label = self
    @items << item
  end

  def already_added?(item)
    @items.include?(item)
  end

  def self.file_path
    './data/labels.json'
  end

  def self.load_collection
    return [] unless File.exist?(file_path)
    
    json_data = File.read(file_path)
    labels_data = JSON.parse(json_data, symbolize_names: true)
    labels_data.map { |label_data| from_json(label_data) }
  end
  
  def self.save_collection(labels)
    labels_data = labels.map(&:to_json)
    json_data = JSON.generate(labels_data)
    File.write(file_path, json_data)
  end

  def to_json(*_args)
    {
      title: @title,
      color: @color,
      item: @item.to_json,
      items: @items.map(&:to_json)
    }
  end

  def self.from_json(data)
    item = Item.from_json(data[:item])
    label = new(data[:title], data[:color], item)
    data[:items].each { |item_data| label.add_item(Item.from_json(item_data)) }
    label
  end
end
