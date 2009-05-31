class ProjectComponent < ActiveRecord::Base
  attr_accessor :component_count
  attr_accessor :consider_count

  belongs_to  :project
  belongs_to  :component

  validates_numericality_of :project_id
  validates_numericality_of :component_id
  validates_numericality_of :count
end
