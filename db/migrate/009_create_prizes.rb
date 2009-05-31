class CreatePrizes < ActiveRecord::Migration
  def self.up
    create_table :prizes do |t|
      t.decimal   :value
      t.integer   :quantity
      t.integer   :component_id
      t.integer   :supplier_id
      t.date      :begin
      t.date      :end
    end
  end

  def self.down
    drop_table :prizes
  end
end
