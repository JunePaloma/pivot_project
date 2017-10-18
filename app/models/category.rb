class Category < ApplicationRecord

  has_many :items
  validates :name, presence: :true, uniqueness: :true

  def image
    items.select('items.*')
      .where("items.category_id = #{self.id}")
      .order('RANDOM()')
      .limit(1)
      .first
      .image_path
  end
end
