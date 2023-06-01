require_relative '../catalog/music_album'

RSpec.shared_examples 'an item that can be archived' do
  it 'returns true if on_spotify is true and publish date < 10 years' do
    subject.move_to_archive
    expect(subject.archived).to be true
  end

  it 'returns false if on_spotify is false' do
    subject.on_spotify = false
    subject.move_to_archive
    expect(subject.archived).to be false
  end

  it 'returns false if publish_date is < 10 years' do
    subject.publish_date = '2020-01-01'
    subject.move_to_archive
    expect(subject.archived).to be false
  end
end

RSpec.describe MusicAlbum do
  let(:title) { 'title' }
  let(:on_spotify) { true }
  let(:genre) { 'rnb' }
  let(:publish_date) { '2010-01-01' }

  subject { MusicAlbum.new(title, on_spotify, genre, publish_date) }

  describe '#new' do
    it 'takes four parameters and returns a MusicAlbum object' do
      expect(subject).to be_an_instance_of MusicAlbum
    end
  end

  describe '#title' do
    it 'returns the correct title' do
      expect(subject.title).to eql title
    end
  end

  describe '#on_spotify' do
    it 'returns the correct on_spotify' do
      expect(subject.on_spotify).to eql on_spotify
    end
  end

  describe '#publish_date' do
    it 'returns the correct publish_date' do
      expect(subject.publish_date).to eql publish_date
    end
  end

  describe '#can_be_archived?' do
    it_behaves_like 'an item that can be archived'
  end
end
