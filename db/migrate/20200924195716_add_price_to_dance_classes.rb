class AddPriceToDanceClasses < ActiveRecord::Migration[6.0]
  def change
    add_column :dance_classes, :price, :integer
  end
end
