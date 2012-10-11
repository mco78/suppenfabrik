class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :registerable, :recoverable,  :rememberable, :token_authenticatable, :encryptable, :confirmable, :lockable, :validatable, :timeoutable and :omniauthable
  devise :database_authenticatable, :trackable
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  
end
