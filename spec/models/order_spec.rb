require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:customer) { create(:customer) }
  let(:store) { create(:store) }
  let(:cart) { create(:cart, customer: customer) }
  let!(:item) { create(:item, price: 10.0) }
  let!(:cart_item) { create(:cart_item, cart: cart, item: item, quantity: 2) }

  it 'is valid with valid attributes' do
    expect(build(:order, customer: customer, store: store, cart: cart)).to be_valid
  end

  it 'is not valid without a customer' do
    expect(build(:order, store: store, cart: cart, customer: nil)).not_to be_valid
  end

  it 'is not valid without a store' do
    expect(build(:order, customer: customer, cart: cart, store: nil)).not_to be_valid
  end

  it 'is not valid without a cart' do
    expect(build(:order, customer: customer, store: store, cart: nil)).not_to be_valid
  end

  it 'calculates the total after save' do
    order = build(:order, customer: customer, store: store, cart: cart)
    order.save
    expect(Order.last.total).to eq(20.0)
  end
end