class Shift < ActiveRecord::Base
  attr_accessible :start, :stop, :user_id

  validates :user_id,	:presence => true
  validates :start,		:presence => true

  belongs_to :user

  

end
