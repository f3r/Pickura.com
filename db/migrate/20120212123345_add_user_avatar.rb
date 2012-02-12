class AddUserAvatar < ActiveRecord::Migration
  def up
    add_column :users, :avatar, :string
  end

  def down
    remove_column :users, :picture
  end
end
