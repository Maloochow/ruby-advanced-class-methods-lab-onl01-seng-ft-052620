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
    s = self.new
    @@all << s
    s
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end
  
  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else 
      self.find_by_name(name)
    end
  end
  
  def self.alphabetical
    @@all.sort! {|a, b| a.name[0] <=> b.name[0]}
    @@all
  end
  
  def self.new_from_filename(filename)
    filename_array = filename.chomp(".mp3").split(" - ")
    newsong = self.new_by_name(filename_array[1])
    newsong.artist_name = filename_array[0]
    newsong
  end

  def self.create_from_filename(filename)
    newsong = self.new_from_filename(filename)
    newsong.save
    newsong
  end

  def self.destroy_all
    @@all.clear
  end
end
