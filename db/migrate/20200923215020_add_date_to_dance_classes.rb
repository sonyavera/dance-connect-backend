class AddDateToDanceClasses < ActiveRecord::Migration[6.0]
  def change
    add_column :dance_classes, :date, :date
  end
end
