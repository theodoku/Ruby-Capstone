class List
  def label_list(labels)
    if labels.empty?
      puts 'There are no labels available yet ❌!'
    else
      puts '🔖: Labels list:'
      labels.each_with_index do |label, index|
        puts "[#{index + 1}] Title: #{label.title}, Color: #{label.color}"
      end
    end
  end

  def book_list(books)
    if books.empty?
      puts 'There are no books available yet :x:!'
    else
      puts '📖: Books list:'
      books.each_with_index do |book, index|
        puts "[#{index + 1}] Title: #{book.title}, " \
             "Publisher: #{book.publisher}, " \
             "Author: #{book.author.first_name} #{book.author.last_name}, " \
             "Cover_State: #{book.cover_state}, " \
             "Archived: #{book.archived || (book.cover_state == 'bad')}"
      end
    end
  end

  def music_album_list(music_albums)
    if music_albums.empty?
      puts 'There are no music albums available yet :x:!'
    else
      puts '📝: Music albums list:'
      music_albums.each_with_index do |music_album, index|
        puts "[#{index + 1}] Title: #{music_album.title}, " \
             "Spotify: #{music_album.on_spotify}, " \
             "Genre: #{music_album.genre.name}, " \
             "Published: #{music_album.publish_date}, " \
             "Archived: #{music_album.archived}"
      end
    end
  end

  def genre_list(genres)
    if genres.empty?
      puts 'There are no genres available yet :x:!'
    else
      puts '📑: Genres list:'
      genres.each_with_index do |genre, index|
        puts "[#{index + 1}] Name: #{genre.name}"
      end
    end
  end

  def game_list(games)
    if games.empty?
      puts 'There are no games available yet :x:!'
    else
      puts '🏏: Games list:'
      games.each_with_index do |game, index|
        puts "[#{index + 1}] Label: #{game.label.title}, " \
             "Last played at: #{game.last_played_at}, " \
             "Multiplayer: #{game.multiplayer}, " \
             "Publish date: #{game.publish_date}"
      end
    end
  end

  def author_list(authors)
    if authors.empty?
      puts 'There is no author available yet :x:!'
    else
      puts '👨‍🏫: Authors list:'
      authors.each_with_index do |author, index|
        puts "[#{index + 1}] First name: #{author.first_name}, Last name: #{author.last_name}"
      end
    end
  end
end
