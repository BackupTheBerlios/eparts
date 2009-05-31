class Component < ActiveRecord::Base
  attr_accessor :count
  attr_accessor :order

  has_many    :prizes
  has_many    :project_components
  has_many    :stocks
  has_many    :kicad_components
  belongs_to  :component_category
  belongs_to  :component_housing
  belongs_to  :kicad_housing
  has_and_belongs_to_many :blobs
  has_many    :components_photos
  has_and_belongs_to_many :photos

  validates_presence_of     :name
  validates_numericality_of :component_category_id
  validates_numericality_of :component_housing_id
end
