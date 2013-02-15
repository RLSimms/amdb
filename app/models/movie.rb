class Movie < ActiveRecord::Base
  attr_accessible :director_id, :title, :year

  validates_presence_of :director_id, :title

  belongs_to :director

  has_many :roles

  has_many :votes

  has_many :actors, :through => :roles

  has_many :users, :through => :votes
end
