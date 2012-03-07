class AddDownloadSeedFakeToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :download_seed_fake, :integer, :default => 0

  end
end
