class OrderTicket < ActiveRecord::Base
  belongs_to :order
  belongs_to :ticket

  validates_numericality_of :quantity, greater_than: 0, allow_blank: true
end
