class Reply < ActiveRecord::Base
  belongs_to :comment
  attr_accessible :body, :commenter
end
