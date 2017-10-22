class Operator < ApplicationRecord
  has_secure_password
  enum role: ["manager", "admin"]

  def store_admin?
    self.role == "admin"
  end

end
