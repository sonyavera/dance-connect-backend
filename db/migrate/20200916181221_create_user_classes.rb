class CreateUserClasses < ActiveRecord::Migration[6.0]
  def change
    create_table :user_classes do |t|
      t.integer :user_id
      t.integer :dance_class_id

      t.timestamps
    end
  end
end
