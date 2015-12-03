class User < ActiveRecord::Base
  has_secure_password
  has_many :orders

  validates :username, presence: true
  validates :name, presence: true
  validates :password, presence: true

  has_many   :user_roles
  has_many   :roles, through: :user_roles


  def admin?
    role == 1
  end

  def platform_admin?
    roles.exists?(name: "platform_admin")
  end

  def store_admin?
    roles.exists?(name: "store_admin")
  end

  def registered_user?
    roles.exists?(name: "regisitered_user")
  end

end
