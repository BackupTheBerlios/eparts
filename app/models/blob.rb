class Blob < ActiveRecord::Base
  has_and_belongs_to_many :components

  def blob_file=( data )
    self.name = core( data.original_filename )
    self.format = data.content_type.chomp
    self.data = data.read
  end

  private

  def core( name )
    File.basename(name).gsub( /[^\w._-]/, '' )
  end
end
