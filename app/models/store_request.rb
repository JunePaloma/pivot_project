class StoreRequest < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :operator, optional: true
  enum status: ["pending", "declined", "approved"]
end