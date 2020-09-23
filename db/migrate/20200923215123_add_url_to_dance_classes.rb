class AddUrlToDanceClasses < ActiveRecord::Migration[6.0]
  def change
    add_column :dance_classes, :url, :string
  end
end
