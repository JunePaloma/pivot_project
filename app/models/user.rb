class User < ApplicationRecord
  has_secure_password
  has_many :orders

  validates :username, presence: :true, uniqueness: :true
  validates :password_digest, presence: :true
  validates :password, presence: :true, on: :create
  validates :phone, presence: :true, on: :create, unless: :oauth_login
  validates :email, presence: :true, on: :create, unless: :oauth_login
  validates :name, presence: :true, on: :create

  def address
    "#{self.street}, #{self.city}, #{self.state}, #{self.zip_code}, #{self.country}"
  end

  def self.from_oauth(arg)
    user = find_by(uid: arg[:uid]) || User.new
    user.attributes = {
      uid: arg[:uid],
      username: arg[:info][:nickname],
      name: arg[:info][:name],
      password: "P@$$worD",
      oauth_token: arg[:credentials][:token],
      oauth_token_secret: arg[:credentials][:secret]
    }
    user.save
    user
  end

  def registered?
   return true if self.persisted?
  end

  def manager?
    return false
  end

  def admin?
    return false
  end

  def platform_admin?
    return false

  def oauth_login
    oauth_token.present?
  end

end
