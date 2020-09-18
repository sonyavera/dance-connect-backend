class AddDescriptionToDanceClass < ActiveRecord::Migration[6.0]
  def change
    add_column :dance_classes, :description, :string
  end
end
