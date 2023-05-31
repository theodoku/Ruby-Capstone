require_relative '../catalog/label'
require_relative '../catalog/item'

RSpec.describe Label do
  describe '#add_item' do
    let(:label) { Label.new('Label 1', 'Red', nil) }
    let(:item) { Item.new(1, nil, nil, '2023-01-01') }

    it 'adds the item to the collection of items' do
      label.add_item(item)
      expect(label.already_added?(item)).to be true
    end

    it 'sets self as the label property of the item' do
      label.add_item(item)
      expect(item.label).to eq(label)
    end
  end

  describe '#already_added?' do
    let(:label) { Label.new('Label 1', 'Red', nil) }
    let(:item1) { Item.new(1, nil, nil, '2023-01-01') }
    let(:item2) { Item.new(2, nil, nil, '2023-01-01') }

    it 'returns true when the item is already added' do
      label.add_item(item1)
      expect(label.already_added?(item1)).to be true
    end

    it 'returns false when the item is not added' do
      expect(label.already_added?(item2)).to be false
    end
  end
end
