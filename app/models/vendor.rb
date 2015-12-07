class Vendor < ActiveRecord::Base
  belongs_to :user
  has_many :tickets
  has_many :orders
end
