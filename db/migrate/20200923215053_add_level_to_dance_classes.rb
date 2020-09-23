class AddLevelToDanceClasses < ActiveRecord::Migration[6.0]
  def change
    add_column :dance_classes, :level, :string
  end
end
