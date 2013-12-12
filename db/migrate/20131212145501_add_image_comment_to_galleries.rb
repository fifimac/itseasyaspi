class AddImageCommentToGalleries < ActiveRecord::Migration
  def change
    add_column :galleries, :image_comment, :string
  end
end
