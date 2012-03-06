class AddCounterDownloadToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :counter_downloads, :integer, :default => 0
  end
end
