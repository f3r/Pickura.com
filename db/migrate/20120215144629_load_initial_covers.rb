class LoadInitialCovers < ActiveRecord::Migration
  def up
    Dir.glob("#{Rails.root}/db/images/*.jpg") do |entry|
      Picture.create!(:picture => File.open(entry))
    end
  end

  def down
  end
end
