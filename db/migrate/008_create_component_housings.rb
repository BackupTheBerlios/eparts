class CreateComponentHousings < ActiveRecord::Migration
  def self.up
    create_table :component_housings do |t|
      t.string    :name
    end

  end

  def self.down
    drop_table :component_housings
  end
end
