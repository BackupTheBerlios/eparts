class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.integer   :prize_id
      t.integer   :count
      t.integer   :order_state_id

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
