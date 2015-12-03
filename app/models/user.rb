class User < ActiveRecord::Base
  has_secure_password
  has_many :orders

  validates :username, presence: true
  validates :name, presence: true
  validates :password, presence: true

  has_many     :user_roles
  has_many     :roles, through: :user_roles
  has_many     :vendors


  def admin?
    role == 1
  end

  def platform_admin?
    roles.exists?(name: "platform_admin")
  end

  def vendor_admin?
    roles.exists?(name: "vendor_admin")
  end

  def registered_user?
    roles.exists?(name: "registered_user")
  end

end
