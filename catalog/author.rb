class Author
attr_reader :items

def initialize
@items = []
end

def add_item(item)
@items << item unless item_already_added?(item)
end

private

def item_already_added?(item)
@items.include?(item)
end
end
