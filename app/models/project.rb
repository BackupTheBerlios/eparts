class Project < ActiveRecord::Base
  has_many    :project_components
  belongs_to  :project_state

  validates_presence_of     :name
  validates_numericality_of :project_state_id
end
