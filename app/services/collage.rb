class Collage
  def self.generate
    require 'RMagick'
    include Magick
    tiles = []
    #def drowit(tiles, board_details, size)
    width = 851
    height = 315
    #cat = Image.new(width, height)
    cat = ImageList.new("#{Rails.root}/public/images/collage/background.png")
    ['1.jpg', '2.jpg', '1.jpg', '2.jpg'].each_with_index do |name, i|
      image = ImageList.new("#{Rails.root}/public/images/collage/#{name}")
      image.background_color = "none"
      image.rotate!(rand(60)-30)
      tiles << [image, i]
    end

    tiles.shuffle!
    tiles.each do |image, i|
      cat.composite!(image, i*190 + 50, i*20, OverCompositeOp)
    end

    file_path = "#{Rails.root}/public/images/collage/output.jpg"
    cat.write(file_path)
  end
end