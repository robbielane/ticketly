class Vendor < ActiveRecord::Base
  belongs_to :user
  has_many :tickets
  has_many :orders

  validates :slug, presence: true, uniqueness: true
  enum status: [ :inactive, :active]
  before_validation :generate_slug

  def generate_slug
    self.slug = name.parameterize
  end


end
