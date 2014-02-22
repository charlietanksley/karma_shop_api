class Product < ActiveRecord::Base
  has_many :treasures, dependent: :destroy
end
