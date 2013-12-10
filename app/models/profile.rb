class Profile < ActiveRecord::Base
	belongs_to :user
  attr_accessible :avatar, :avatar, :bio, :location, :user_id, :website

end
