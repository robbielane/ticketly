class Vendor < ActiveRecord::Base
  belongs_to :user
  has_many :tickets
  has_many :orders

  enum status: [ :inactive, :active]
end
