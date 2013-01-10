class Product < ActiveRecord::Base
  attr_accessible :capture, :name

  validates_presence_of :name
end
