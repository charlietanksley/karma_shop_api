class TreasureShelf < ActiveRecord::Base
  # validates :customer_id, uniqueness: true

  belongs_to :customer, inverse_of: :treasure_shelf
  has_many :treasures, inverse_of: :treasure_shelf

  def add(treasure)
    treasures << treasure
  end
end
