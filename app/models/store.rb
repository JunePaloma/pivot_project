class Store < ApplicationRecord
  has_many :items
  has_many :store_operators
  has_many :operators, through: :store_operators
end
