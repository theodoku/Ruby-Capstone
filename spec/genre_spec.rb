require_relative '../catalog/genre'

describe Genre do
  before :each do
    @genre = Genre.new('Comedy')
    @item = double('Item')
  end

  it 'Checking Game instance' do
    expect(@genre).to be_instance_of Genre
  end

  it 'The name should be Comedy' do
    expect(@genre.name).to eql 'Comedy'
  end

  it 'Returns an empty array by default' do
    expect(@genre.items).to be_an_instance_of Array
    expect(@genre.items).to be_empty
  end
end
