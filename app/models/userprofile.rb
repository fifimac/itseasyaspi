class Userprofile < ActiveRecord::Base
  attr_accessible :avatar, :bio, :location, :user_id, :username, :website
    mount_uploader :avatar, ImageUploader
end
