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
  
  desc "Recreate versions of photos - Use from:<no>, to:<no> to process a certain id ranges"
  task :recreate_versions => :environment do
    ini = !ENV['from'].nil? ? ENV['from'].to_i : 1
    fin = !ENV['to'].nil?   ? ENV['to'].to_i   : Photo.last.id

    puts "Starting Photo recreation #{ini} to #{fin}"    
    Photo.where(:id => ini.to_i ..fin.to_i).all.each do |photo|
      photo.source.recreate_versions!
      puts "[#{photo.id}] \"#{photo.name}\" recreated succesfully"
    end
    puts "Finished Photo recreation of #{fin-ini+1} photos. Good job!"    

  end
  
  desc "Recreate avatar files"
  task :recreate_avatar => :environment do
    User.all.each do |user|
      user.avatar.recreate_versions!
      puts "[#{user.id}] #{user.email}'s Avatar recreated succesfully"
    end
  end
end