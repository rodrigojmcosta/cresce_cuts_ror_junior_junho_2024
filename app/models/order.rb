class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :store
  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items

  validates :created_at, :total, :status, presence: true
  validates :status, inclusion: { in: %w[pendente em\ separação confirmado em\ rota disponível\ para\ retirada] }
end