class Gallery < ActiveRecord::Base
  attr_accessible :image, :step, :submitted_by, :user , :image_comment
  belongs_to :user
  mount_uploader :image, ImageUploader
  validates_presence_of :step, :image_comment , :image
end
