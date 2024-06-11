class Customer < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_one :cart, dependent: :destroy

  validates :name, :address, presence: true
  validates :email, presence: true, uniqueness: true
end