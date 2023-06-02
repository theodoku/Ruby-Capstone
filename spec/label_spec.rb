require_relative '../catalog/label'
RSpec.describe Label do
  let(:title) { 'Label 1' }
  let(:color) { 'Red' }
  let(:label) { Label.new(title, color) }
  describe '#new' do
    it 'takes two parameter and returns a Label object' do
      expect(label).to be_an_instance_of Label
    end
  end
  describe '#title' do
    it 'Should be return correct title' do
      expect(label.title).to eql title
    end
  end
  describe '#color' do
    it 'Should be return correct color' do
      expect(label.color).to eql color
    end
  end

  describe '#items' do
    it 'Returns an empty array by default' do
      expect(label.items).to be_an_instance_of Array
      expect(label.items).to be_empty
    end
  end
end
