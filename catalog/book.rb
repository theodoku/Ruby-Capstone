class Book
    attr_accessor :title, :author, :publisher
  
    def initialize(cover_state, publisher)
      @cover_state = cover_state
      @publisher = publisher
    end

    def can_be_archived?
      super || @cover_state == "bad"
    end
  end
  