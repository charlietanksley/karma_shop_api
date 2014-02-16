class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :uid, presence: true, uniqueness: true
end
