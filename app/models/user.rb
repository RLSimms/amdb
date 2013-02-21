class User < ActiveRecord::Base
  attr_accessible :username, :password

  validates_uniqueness_of :username

  has_many :votes

  has_many :movies, :through => :votes
end
