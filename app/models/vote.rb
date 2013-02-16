class Vote < ActiveRecord::Base
  attr_accessible :movie_id, :user_id

  belongs_to :movie
  belongs_to :user

  validates_presence_of :movie
  validates_presence_of :user
  validates_uniqueness_of :user_id, :scope => [:movie_id], :message => "has already voted for that movie"
  validate :user_cannot_vote_more_than_three_times

  def user_cannot_vote_more_than_three_times
    if self.user && self.user.votes.count >= 3
      errors.add(:user, "can't vote more than three times")
    end
  end
end
