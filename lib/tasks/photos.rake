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
  
  desc "Recreate version"
  task :recreate_versions => :environment do
    Photo.all.each do |photo|
      photo.source.recreate_versions!
      puts "[#{photo.id}] \"#{photo.name}\" recreated succesfully"
    end
  end
  
  desc "Recreate avatar files"
  task :recreate_avatar => :environment do
    User.all.each do |user|
      user.avatar.recreate_versions!
      puts "[#{user.id}] #{user.email}'s Avatar recreated succesfully"
    end
  end
end