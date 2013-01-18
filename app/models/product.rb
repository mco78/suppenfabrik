class Product < ActiveRecord::Base
  attr_accessible :capture, :name

  has_many :sales

  validates_presence_of :name
end
