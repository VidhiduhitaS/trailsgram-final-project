class CreateBookmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmarks do |t|
      t.integer :user_id
      t.integer :trail_id

      t.timestamps
    end
  end
end
