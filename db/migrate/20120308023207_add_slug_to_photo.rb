class AddSlugToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :slug, :string
    add_index :photos, :slug, unique: true
  end
end
