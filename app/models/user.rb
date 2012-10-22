class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :registerable, :recoverable,  :rememberable, :token_authenticatable, :encryptable, :confirmable, :lockable, :validatable, :timeoutable and :omniauthable
  devise :database_authenticatable, :trackable
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me,
                  :user_management, :time_tracking, :time_tracking_admin
  
  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :shifts

  def start_shift
  	Shift.create(	:user_id => self.id,
  					:start => Time.now)
  end

  def end_shift(shift)
  	@shift = shift
  	@shift.stop = Time.now
  	@shift.save
  end


end
