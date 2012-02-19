class AddPhotoWatermarkPosition < ActiveRecord::Migration
  def change
    add_column :photos, :watermark_position, :string
  end
end
