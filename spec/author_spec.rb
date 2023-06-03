require_relative '../catalog/author'

describe Author do
  before :each do
    @author = Author.new('Simon', 'Chowdery')
    @item = double('Item')
  end

  it 'Checking Game instance' do
    expect(@author).to be_instance_of Author
  end

  it 'First name should be Simon' do
    expect(@author.first_name).to eql 'Simon'
  end

  it 'Last name should be Chowdery' do
    expect(@author.last_name).to eql 'Chowdery'
  end

  it 'Returns an empty array by default' do
    expect(@author.items).to be_an_instance_of Array
    expect(@author.items).to be_empty
  end
end
