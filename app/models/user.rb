class User < ActiveRecord::Base
  has_secure_password
  has_many :orders

  validates :username, presence: true
  validates :name, presence: true
  validates :password, presence: true

  def admin?
    role == 1
  end
end
