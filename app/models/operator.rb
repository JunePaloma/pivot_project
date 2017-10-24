class Operator < ApplicationRecord
  has_secure_password
  has_many :store_operators
  has_many :stores, through: :store_operators
  enum role: ["manager", "admin", "platform_admin"]

  def store_admin?
    self.role == "admin"
  end



end
