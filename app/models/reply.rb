class Reply < ActiveRecord::Base
  belongs_to :comment
  attr_accessible :body, :comment, :comment_id
end
