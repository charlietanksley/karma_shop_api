class Customer < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_one :treasure_shelf, dependent: :destroy
end
