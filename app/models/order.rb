class Order < ActiveRecord::Base
  belongs_to  :prize
  belongs_to  :order_state

  validates_numericality_of :prize_id
  validates_numericality_of :count
  validates_numericality_of :order_state_id
end
