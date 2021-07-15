class Song < ActiveRecord::Base
  # add associations here
  def genre_name=(genre)
    self.genre = Genre.find_or_create_by(name:genre)
  end

  def genre_name
    self.genre.name if self.genre
  end

  def artist_name=(artist)
    self.artist_id = Artist.find_or_create_by(name:artist_id)
  end

  def artist_name
    self.artist_id.name if self.artist
  end

  def note_contents=(contents)
    contents.each do |note|
      unless note == "" || note == nil
        self.notes.build(content: note)
      end
    end
  end

  def note_contents
    self.notes.map{|note| note.content}
  end

end