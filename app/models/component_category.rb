class ComponentCategory < ActiveRecord::Base
  has_many  :components

  validates_presence_of :name
end
