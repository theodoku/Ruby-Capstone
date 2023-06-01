require 'rspec'
require_relative 'book'

describe Book do
  let(:book) { Book.new('good', 'Publisher') }

  describe '#can_be_archived?' do
    context "when cover_state is 'good'" do
      it 'returns false' do
        expect(book.can_be_archived?).to be(false)
      end
    end

    context "when cover_state is 'bad'" do
      before { book.instance_variable_set(:@cover_state, 'bad') }

      it 'returns true' do
        expect(book.can_be_archived?).to be(true)
      end
    end
  end
end
