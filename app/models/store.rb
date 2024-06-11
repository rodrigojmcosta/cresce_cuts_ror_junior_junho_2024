class Store < ApplicationRecord
  has_many :orders, dependent: :destroy

  validates :name, :address, presence: true
end