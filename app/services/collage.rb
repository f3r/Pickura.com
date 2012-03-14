class Collage
  WIDTH = 851
  HEIGHT = 315

  def self.generate
    require 'RMagick'
    include Magick
    tiles = []

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

  def self.echo(user,background)
    require 'RMagick'
    include Magick

    # Download profile picture
    photo_url = user.avatar.url
    photo     = open(URI.parse(photo_url))
    image     = ImageList.new
    image.from_blob(photo.read)

    image.scale!(125, 125)

    if background
      photo  = open(URI.parse(Photo.find(background).source.url))
      cover  = ImageList.new
      cover.from_blob(photo.read)
    else
      cover = Magick::Image.new(WIDTH, HEIGHT)
      rgb = '#000'
      cover = cover.colorize(1,1,1, rgb)
    end

    image_with_border = add_border(image)

    5.downto(0).each do |i|
      y = HEIGHT - 125 - 20 - i*40
      x = i*60 + 85
      image_with_border.opacity = Magick::MaxRGB * 0.1 * i
      cover.composite!(image_with_border, x, y, OverCompositeOp)
    end

    out = "#{Rails.root}/tmp/#{Time.now.to_i}.jpg"
    cover.write(out)

    out
  end

  def self.add_border(image)
    border = ImageList.new("#{Rails.root}/public/images/collage/photo-border.png")
    # TODO: centrar
    border.composite!(image, 4, 4, OverCompositeOp)
    border
  end
end