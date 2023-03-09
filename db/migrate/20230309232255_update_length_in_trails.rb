class UpdateLengthInTrails < ActiveRecord::Migration[6.0]
  def change
    remove_column :trails, :length
    add_column :trails, :length, :float
  end
end
