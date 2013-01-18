class Store < ActiveRecord::Base
  attr_accessible :name

  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :shifts
  has_many :sales
  has_many :checkouts
  
end
