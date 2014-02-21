class Customer < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_one :treasure_shelf, dependent: :destroy

  def treasures
    return Array.new if treasure_shelf.nil?
    treasure_shelf.treasures
  end
end
