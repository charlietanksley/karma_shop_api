require_relative 'treasure_shelf'

class Customer < ActiveRecord::Base
  after_create :ensure_treasure_shelf

  validates :name, presence: true, uniqueness: true

  has_one :treasure_shelf, dependent: :destroy

  def treasures
    return Array.new if treasure_shelf.nil?
    treasure_shelf.treasures
  end

  private

  def ensure_treasure_shelf
    create_treasure_shelf if treasure_shelf.nil?
  end
end
