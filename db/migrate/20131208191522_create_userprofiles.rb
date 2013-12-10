class CreateUserprofiles < ActiveRecord::Migration
  def change
    create_table :userprofiles do |t|
      t.string :username
      t.string :location
      t.string :bio
      t.string :website
      t.string :avatar
      t.integer :user_id

      t.timestamps
    end
  end
end

