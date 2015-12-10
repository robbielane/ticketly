class Vendor < ActiveRecord::Base
  belongs_to :user
  has_many :tickets
  has_many :orders

  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true
  validates :user_id, presence: true, uniqueness: true
  enum status: [ :inactive, :active]
  before_validation :generate_slug

  def generate_slug
    self.slug = name.parameterize if !name.nil?
  end
end
