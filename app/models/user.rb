class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me ,:username , :bio , :location
  # attr_accessible :title, :body

  validates_presence_of :email
   # validates_presence_of :attribute, :on => :create , :message => "can't be black"
end
