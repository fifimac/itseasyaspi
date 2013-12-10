class Comment < ActiveRecord::Base
  attr_accessible :text, :title

  has_many :replies, dependent: :destroy
  
  validates :title,
    presence: true,
    length: { minimum: 5 }
end
