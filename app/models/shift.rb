class Shift < ActiveRecord::Base
  attr_accessible :start, :stop, :user_id, :store_id

  validates_presence_of :user_id
  validates_presence_of :start
  validates_presence_of :store_id

  belongs_to :user
  belongs_to :store


end
