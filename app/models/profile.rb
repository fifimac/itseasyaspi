class Profile < ActiveRecord::Base
  attr_accessible :avatar, :avatar, :bio, :location, :user_id, :website
end
