class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre

  def get_genre_name
    self.genre.name 
  end

  def artist_exists?(artist_name)
    if Artist.all.find{|one_artist| one_artist.name = artist_name}
      return true 
    else return false 
    end 
  end 
    
  def drake_made_this
    if artist_exists?("Drake")
      artist_object = Artist.all.find{|one_artist| one_artist.name = "Drake"}
    else 
      artist_object = Artist.create(:name=>"Drake")
    end 
    self.artist = artist_object
    artist_object.songs << self 
  end

end