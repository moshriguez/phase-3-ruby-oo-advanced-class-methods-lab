class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = self.new
    new_song.save
    new_song
  end

  def self.new_by_name(song)
    new_song = self.new
    new_song.name = song
    new_song
  end

  def self.create_by_name(song)
    new_song = self.new
    new_song.name = song
    new_song.save
    new_song
  end

  def self.find_by_name(song_query)
    self.all.find {|song| song.name == song_query}
  end 

  def self.find_or_create_by_name(song_query)
    if self.find_by_name(song_query)
      self.find_by_name(song_query)
    else
      self.create_by_name(song_query)
    end
  end

  def self.alphabetical
    self.all.sort {|a, b| a.name <=> b.name}
  end

  def self.new_from_filename(filename) #filename format "Taylor Swift - Blank Space.mp3"
    song_artist_array = filename.sub(".mp3", '').split(" - ")
    new_song = self.create_by_name(song_artist_array[1])
    new_song.artist_name = song_artist_array[0]
    new_song
  end
  
  def self.create_from_filename(filename)
    song_artist_array = filename.sub(".mp3", '').split(" - ")
    new_song = self.create_by_name(song_artist_array[1])
    new_song.artist_name = song_artist_array[0]
  end

  def self.destroy_all
    @@all = []
  end

end
