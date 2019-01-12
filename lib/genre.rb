# 1/8/19 MUST UPDATE from has-many-through lab
require 'pry'

class Genre

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
  end

  def self.create(name)
    Genre.new(name).save
    self
  end

# @@all array: methods to save, read & delete list of all Song objects
  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end
# end @@all methods

  def songs
    Song.all.select {|song| song.genre == self}
  end

  def artists
    self.songs.collect {|song| song.artist}
  end

end  #class end