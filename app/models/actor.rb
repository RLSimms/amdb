class Actor < ActiveRecord::Base
  attr_accessible :dob, :name

  validates_presence_of :name

  has_many :roles, :dependent => :destroy
end
