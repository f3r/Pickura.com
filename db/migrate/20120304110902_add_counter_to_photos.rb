class AddCounterToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :counter, :integer, :default => 0
  end
end
