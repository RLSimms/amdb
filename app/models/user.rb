class User < ActiveRecord::Base
  attr_accessible :username, :password, :password_confirmation

  validates_uniqueness_of :username

  has_many :votes

  has_many :movies, :through => :votes

  has_secure_password
end
