class AddDanceClassIdToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :dance_class_id, :integer
  end
end
