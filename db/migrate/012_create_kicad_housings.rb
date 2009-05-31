class CreateKicadHousings < ActiveRecord::Migration
  def self.up
    create_table :kicad_housings do |t|
      t.string    :name
    end
  end

  def self.down
    drop_table :kicad_housings
  end
end
