class CreateComponentCategories < ActiveRecord::Migration
  def self.up
    create_table :component_categories do |t|
      t.string    :name
    end
  end

  def self.down
    drop_table :component_categories
  end
end
