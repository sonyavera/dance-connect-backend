class AddSeedsAvatarToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :seeds_avatar, :string
  end
end
