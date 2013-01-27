class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :registerable, :recoverable,  :rememberable, :token_authenticatable, :encryptable, :confirmable, :lockable, :validatable, :timeoutable and :omniauthable
  devise :database_authenticatable, :trackable
  
  has_many :shifts
  has_many :sales
  has_many :checkouts
  has_many :z_bons
  has_many :receipts

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me,
                  :time_tracking, :admin, :daily_sales
  
  validates_presence_of :name
  validates_uniqueness_of :name

  validates :password,  :presence     => true,
                        :confirmation => true,
                        :length       => { :within => 5..40 }, :on => :create

  validates :password,  :confirmation => true,
                        :length       => { :within => 5..40 }, :on => :update_password

  

  # def start_shift(store_id)
  # 	Shift.create(	:user_id => self.id, :store_id => store_id,
  # 					:start => Time.now)
  # end

  def end_shift(shift)
  	@shift = shift
  	@shift.stop = Time.now + 5*60 #add five minutes to shift
  	@shift.save
  end

  def get_current_store_id
    current_shift = self.shifts.all(:order => :start).last
    if current_shift.stop.nil?
      return current_shift.store_id
    else
      return nil
    end
  end

end

