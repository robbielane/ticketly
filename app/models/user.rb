class User < ActiveRecord::Base
  has_many :orders
  has_secure_password

  validates :username, presence: true
  validates :name, presence: true
  validates :password, presence: true

  def admin?
    role == 1
  end
end
