class StoreRequest < ApplicationRecord
  belongs_to :user
  enum status: ["pending", "declined", "approved"]
end