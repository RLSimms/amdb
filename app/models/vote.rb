class Vote < ActiveRecord::Base
  attr_accessible :movie_id, :user_id

  validates_presence_of :movie_id, :user_id
  validates_uniqueness_of :movie_id, :scope => :user_id, :message => "has already been voted for by this user"
  validate :user_cannot_vote_more_than_three_times

  belongs_to :user
  belongs_to :movie

  def user_cannot_vote_more_than_three_times
    if self.user && self.user.votes.count >= 3
      self.errors.add(:user_id, "has already voted three times")
    end
  end
end
