class Movie < ActiveRecord::Base
  attr_accessible :director_id, :title, :year, :director_name

  validates_presence_of :title

  belongs_to :director
  has_many :roles, :dependent => :destroy
  has_many :votes, :dependent => :destroy
  has_many :users, :through => :votes

  def director_name
    director.try(:name)
  end

  def director_name=(name)
    self.director = Director.find_or_create_by_name(name) if name.present?
  end
end
