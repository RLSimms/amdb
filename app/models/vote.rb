class Vote < ActiveRecord::Base
  attr_accessible :movie_id, :user_id

  validates_presence_of :movie_id
  validates_presence_of :user_id

  belongs_to :movie

  belongs_to :user
end
