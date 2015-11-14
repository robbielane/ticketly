class Pursuit < ActiveRecord::Base
  belongs_to :activity
  has_many :ordered_trips
  has_many :orders, through: :ordered_trips
end
