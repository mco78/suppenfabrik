class Checkout < ActiveRecord::Base
  attr_accessible :date, :store_id, :user_id,
                  :sales_attributes

  belongs_to :user
  belongs_to :store
  has_many :sales

  accepts_nested_attributes_for :sales, :reject_if => lambda { |a| a[:value].blank? }, :allow_destroy => true

  validates_presence_of :date
  validates_presence_of :user_id

  def set_defaults(current_user)
  	self.user_id = current_user.id
  	self.store_id = current_user.get_current_store_id
  	self.date = Time.now
  end

end
