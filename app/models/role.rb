class Role < ActiveRecord::Base
  attr_accessible :actor_id, :character_name, :movie_id, :movie_title, :actor_name

  validates_presence_of :actor, :movie

  belongs_to :movie
  belongs_to :actor

  def movie_title
    movie.try(:title)
  end

  def movie_title=(title)
    self.movie = Movie.find_or_create_by_title(title) if title.present?
  end

  def actor_name
    actor.try(:name)
  end

  def actor_name=(name)
    self.actor = Actor.find_or_create_by_name(name) if name.present?
  end
end
