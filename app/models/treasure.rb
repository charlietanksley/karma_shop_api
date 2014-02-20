class Treasure < ActiveRecord::Base
  validates :purchase_price, presence: true
  validates :product_id, presence: true

  belongs_to :treasure_shelf
  belongs_to :product
end
