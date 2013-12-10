class Userprofile < ActiveRecord::Base
	belongs_to :user
 	attr_accessible :avatar, :bio, :location, :user_id, :username, :website
    mount_uploader :avatar, ImageUploader
end
