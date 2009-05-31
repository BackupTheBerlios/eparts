class Stock < ActiveRecord::Base
  belongs_to  :component

  validates_numericality_of :component_id
  validates_numericality_of :count
end
