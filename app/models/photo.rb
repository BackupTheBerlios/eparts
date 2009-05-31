class Photo < ActiveRecord::Base
  has_and_belongs_to_many :components

  def photo_file=( data )
    self.name = core( data.original_filename )
    self.format = data.content_type.chomp
    self.data = data.read

    # Here is a call to ImageMagick tool identity
    # it prints to standard output
    # type, width and height of images
    # (this is specified by -format %m,%w,%h)
  # identify = `#{IMAGE_MAGICK_PATH}/identify -format %m,%w,%h #{pic.path} 2>&1`
    identify = `#{IMAGE_MAGICK_PATH}/identify -format %m,%w,%h /home/internet/Desktop/#{data.original_filename} 2>&1`
    # Now identity is a string like "JPEG,640,480"

    # We split this string to array
    jpeg_info = identify.split( ',', 3 )
    self.x = jpeg_info[1].to_i
    self.y = jpeg_info[2].to_i
  end

  def geometry( max_x, max_y )
    fx = max_x.to_f / self.x
    fy = max_y.to_f / self.y
    f = fx < fy ? fx : fy
    %Q"#{(self.x * f).round}x#{(self.y * f).round}"
  end

  private

  def core( name )
    File.basename(name).gsub( /[^\w._-]/, '' )
  end
end
