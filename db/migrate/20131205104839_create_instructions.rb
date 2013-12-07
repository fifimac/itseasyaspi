class CreateInstructions < ActiveRecord::Migration
  def change
    create_table :instructions do |t|
      t.integer :step
      t.string :title
      t.string :content
      t.string :images

      t.timestamps
    end
  end
end
