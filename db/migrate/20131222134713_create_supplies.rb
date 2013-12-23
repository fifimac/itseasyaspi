class CreateSupplies < ActiveRecord::Migration
  def change
    create_table :supplies do |t|
      t.string :name
      t.boolean :bought

      t.timestamps
    end
  end
end
