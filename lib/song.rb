require 'pry'

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
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == true
      song.name
    else
    self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name.downcase}
  end

  def self.new_from_filename(file_name)
      data = file_name.split(/[-,.]/)
      name = data[1].strip
      artist_name = data[0].strip
    song = self.create_new_by_name_and_artist_name(name, artist_name)
  end

  def self.create_new_by_name_and_artist_name(name, artist_name)
    song = self.new
    song.name = name
    song.artist_name = artist_name
    song.save
    song
  end

  def self.create_from_filename(file_name)
    data = file_name.split(/[-,.]/)
    name = data[1].strip
    artist_name = data[0].strip
    song = self.create_new_by_name_and_artist_name(name, artist_name)
  end

  def self.destroy_all
    self.all.clear
  end

end

# new_song_array = unformatted_file.split(/[-,.]/)
# x = new_song_array.collect do |element|
#   name = element[0]
#   artist_name = element[1]
