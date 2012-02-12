class AddPictureColumn < ActiveRecord::Migration
  def up
    add_column :pictures, :picture, :string
  end

  def down
    remove_column :pictures, :picture
  end
end
