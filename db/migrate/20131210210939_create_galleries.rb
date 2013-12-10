class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :image
      t.integer :submitted_by
      t.integer :step
  

      t.timestamps
    end
  end
end
