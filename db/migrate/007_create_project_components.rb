class CreateProjectComponents < ActiveRecord::Migration
  def self.up
    create_table :project_components do |t|
      t.integer   :project_id
      t.integer   :component_id
      t.integer   :count

      t.timestamps
    end
  end

  def self.down
    drop_table :project_components
  end
end
