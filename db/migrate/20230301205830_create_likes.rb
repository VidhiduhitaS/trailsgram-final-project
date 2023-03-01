class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.integer :trail_id
      t.integer :photos_id

      t.timestamps
    end
  end
end
