class Pursuit < ActiveRecord::Base
  belongs_to :activity
  has_many :ordered_trips
  has_many :orders, through: :ordered_trips
  has_attached_file :image
  
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  validates :name, :description, :price, :activity_id, presence: true
  validates_numericality_of :price, greater_than: 0
  # validates :name, uniqueness: true

  def retire
    self.update(status: "retired")
  end

  def retired?
    status == "retired"
  end
end
