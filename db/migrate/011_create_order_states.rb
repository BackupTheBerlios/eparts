class CreateOrderStates < ActiveRecord::Migration
  def self.up
    create_table :order_states do |t|
      t.string    :name

      t.timestamps
    end

    OrderState.create :name => "needs"
    OrderState.create :name => "orders"
    OrderState.create :name => "supplies"
  end

  def self.down
    drop_table :order_states
  end
end
