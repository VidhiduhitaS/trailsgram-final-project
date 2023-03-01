class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.string :url
      t.integer :user_id
      t.integer :trail_id
      t.integer :likes_count

      t.timestamps
    end
  end
end
