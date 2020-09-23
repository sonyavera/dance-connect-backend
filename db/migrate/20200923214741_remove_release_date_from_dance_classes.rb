class RemoveReleaseDateFromDanceClasses < ActiveRecord::Migration[6.0]
  def change
    remove_column :dance_classes, :release_date, :date
  end
end
