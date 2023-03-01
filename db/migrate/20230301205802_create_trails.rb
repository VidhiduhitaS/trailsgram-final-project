class CreateTrails < ActiveRecord::Migration[6.0]
  def change
    create_table :trails do |t|
      t.string :name
      t.boolean :length
      t.integer :duration
      t.string :address
      t.string :difficulty
      t.integer :photos_count
      t.integer :comments_count
      t.integer :bookmarks_count
      t.integer :likes_count

      t.timestamps
    end
  end
end
