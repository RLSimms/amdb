class User < ActiveRecord::Base
  attr_accessible :username

  validates_presence_of :username
  validates_uniqueness_of :username

  has_many :votes, :dependent => :destroy
  has_many :movies, :through => :votes
end
