class Supplier < ActiveRecord::Base
  has_many    :prizes

  validates_presence_of :name
end
