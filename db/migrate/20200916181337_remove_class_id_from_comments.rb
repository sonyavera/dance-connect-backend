class RemoveClassIdFromComments < ActiveRecord::Migration[6.0]
  def change
    remove_column :comments, :class_id, :integer
  end
end
