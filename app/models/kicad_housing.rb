class KicadHousing < ActiveRecord::Base
  has_many  :components
  has_many  :kicad_components

  validates_presence_of :name
end
