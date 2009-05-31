class Prize < ActiveRecord::Base
  attr_accessor :order

  has_many    :orders
  belongs_to  :component
  belongs_to  :supplier

  validates_presence_of     :begin
  validates_presence_of     :end
  validates_numericality_of :value
  validates_numericality_of :quantity
  validates_numericality_of :component_id
  validates_numericality_of :supplier_id
end
