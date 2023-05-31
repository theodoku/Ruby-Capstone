require_relative '../catalog/genre'

RSpec.describe Genre do
  let(:name) { 'Rock' }
  subject { Genre.new(name) }

  describe '#new' do
    it 'takes one parameter and returns a Genre object' do
      expect(subject).to be_an_instance_of Genre
    end
  end

  describe '#name' do
    it 'returns the correct name' do
      expect(subject.name).to eql name
    end
  end

  describe '#id' do
    it 'returns a random ID between 1 and 1000' do
      expect(subject.id).to be >= 1
      expect(subject.id).to be <= 1000
    end
  end

  describe '#items' do
    it 'returns an empty array by default' do
      expect(subject.items).to be_an_instance_of Array
      expect(subject.items).to be_empty
    end
  end

  describe '#add_item' do
    let(:item) { double('Item') }

    it 'adds the item to the genre items' do
      expect { subject.add_item(item) }.to change { subject.items.length }.by(1)
    end

    it 'does not add the item if it is already added' do
      subject.add_item(item)
      expect { subject.add_item(item) }.not_to(change { subject.items.length })
    end
  end
end
