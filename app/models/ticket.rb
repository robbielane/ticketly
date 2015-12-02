class Ticket < ActiveRecord::Base
  belongs_to :category
  has_many :ordered_trips
  has_many :orders, through: :ordered_trips

  validates :name, :price, :category_id, presence: true
  validates_numericality_of :price, greater_than: 0

  searchkick

  def retire
    self.update(status: "retired")
  end

  def retired?
    status == "retired"
  end
end
