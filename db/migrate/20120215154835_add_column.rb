class AddColumn < ActiveRecord::Migration
  def up
    add_column :images, :image, :string
  end

  def down
    remove_column :images, :image
  end
end
