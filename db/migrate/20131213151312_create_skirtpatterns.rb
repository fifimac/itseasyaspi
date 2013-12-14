class CreateSkirtpatterns < ActiveRecord::Migration
  def change
    create_table :skirtpatterns do |t|
      t.integer :user_id
      t.string :makepattern
      t.string :unit
      t.string :skirt_type
      t.integer :waist
      t.integer :length
      t.integer :canvas1
      t.integer :canvas2
      t.integer :canvas3
      t.integer :inner_radius
      t.integer :outer_radius
      t.integer :waistbandLgth
      t.integer :waistbandWdth

      t.timestamps
    end
  end
end
