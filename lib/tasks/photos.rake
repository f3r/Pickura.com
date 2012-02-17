require 'pathname'

namespace :pictures do
  desc "Upload images from db/image/* to S3 and database"
  task :upload => :environment do
    # directory = 'images_fbprofilecovers.com'
    directory = 'images_myfbcovers.com'
    count = 567
    Dir.glob("#{Rails.root}/db/images/#{directory}/*.png") do |entry|
      # Extract photo name from filename
      filename = Pathname.new(entry).basename.to_s.gsub!(/_/, ' ').split('.')[0]
      Photo.create!(:name => filename, :source => File.open(entry))
      puts "[#{count}] Image uploaded successfully - #{filename}"
      count += 1
    end  
  end
end