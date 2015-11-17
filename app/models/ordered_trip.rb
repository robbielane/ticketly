class OrderedTrip < ActiveRecord::Base
  belongs_to :order
  belongs_to :pursuit

  validates_numericality_of :travellers, greater_than: 0, allow_blank: true
end
