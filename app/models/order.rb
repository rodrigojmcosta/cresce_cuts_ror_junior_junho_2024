class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :store
  belongs_to :cart
  has_many :cart_items, through: :cart
  has_many :items, through: :cart_items

  enum status: {pending: 0, in_progress: 1, confirmed: 2, in_route: 3, ready_for_pickup: 4 }

  validates :status, presence: true
  validate :must_have_items_in_cart

  before_save :calculate_total

  def accept_order
    return errors.add(:status, "Um pedido só pode ser aceito caso esteja pendente!") unless pending?

    update(status: :in_progress)
    cart.cart_items.update_all(separated: false)
  end

  def complete_separation
    return errors.add(:status, "Um pedido só pode ser confirmado caso todos os itens estejam separados!") unless in_progress? && all_cart_items_separated?
    update(status: :confirmed)
  end

  def complete_payment_and_dispatch
    return errors.add(:status, "Um pedido só pode ser enviado para rota caso já esteja confirmado") unless confirmed?
    update(status: :in_route)
  end

  def complete_payment_and_ready_for_pickup
    return errors.add(:status, "Um pedido só pode ser definifo como pronto para entrega caso esteja confirmado") unless in_route?
    update(status: :ready_for_pickup)
  end

  private

  def calculate_total
    return unless cart.present?

    self.total = cart.cart_items.sum { |cart_item| cart_item.item.price * cart_item.quantity }
  end

  def all_cart_items_separated?
    cart.cart_items.all?(&:separated)
  end

  def must_have_items_in_cart
    errors.add(:base, "É necessário pelo menos um item no carrinho para cadastrar o pedido.") unless cart&.cart_items&.any?
  end
end