class CreateKicadComponents < ActiveRecord::Migration
  def self.up
    create_table :kicad_components do |t|
      t.string    :name
      t.integer   :kicad_housing_id
      t.integer   :component_id
      t.date      :created_on
      t.date      :updated_on
    end
  end

  def self.down
    drop_table :kicad_components
  end
end
