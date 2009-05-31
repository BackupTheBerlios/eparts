class CreateComponents < ActiveRecord::Migration
  def self.up
    create_table :components do |t|
      t.string    :name
      t.string    :remark
      t.integer   :component_category_id
      t.integer   :component_housing_id

      t.timestamps
    end
  end

  def self.down
    drop_table :components
  end
end
