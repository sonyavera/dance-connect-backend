class CreateDanceClasses < ActiveRecord::Migration[6.0]
  def change
    create_table :dance_classes do |t|
      t.integer :user_id
      t.string :style
      t.date :release_date

      t.timestamps
    end
  end
end
