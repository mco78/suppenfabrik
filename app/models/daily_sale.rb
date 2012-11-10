class DailySale < ActiveRecord::Base
  
	has_many :sales, :dependent => :destroy
	accepts_nested_attributes_for :sales, :reject_if => lambda { |a| a[:value].blank? }, :allow_destroy => true

  	attr_accessible :date, :store_id, :sales_attributes

  	validates_presence_of :date

end
