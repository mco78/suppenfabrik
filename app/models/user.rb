class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :registerable, :recoverable,  :rememberable, :token_authenticatable, :encryptable, :confirmable, :lockable, :validatable, :timeoutable and :omniauthable
  devise :database_authenticatable, :trackable
  
  has_many :shifts
  has_many :sales

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me,
                  :time_tracking, :admin, :daily_sales
  
  validates_presence_of :name
  validates_uniqueness_of :name

  

  # def start_shift(store_id)
  # 	Shift.create(	:user_id => self.id, :store_id => store_id,
  # 					:start => Time.now)
  # end

  def end_shift(shift)
  	@shift = shift
  	@shift.stop = Time.now + 5*60 #add five minutes to shift
  	@shift.save
  end


end
