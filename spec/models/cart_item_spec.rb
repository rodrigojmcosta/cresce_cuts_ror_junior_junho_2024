require 'rails_helper'

RSpec.describe CartItem, type: :model do
  let(:item) { create(:item, stock_quantity: 10) }
  let(:cart_item) { build(:cart_item, item: item, quantity: 5) }

  it 'is valid with valid attributes' do
    expect(cart_item).to be_valid
  end

  it 'is not valid without a quantity' do
    expect(build(:cart_item, quantity: nil)).not_to be_valid
  end

  it 'decreases the stock quantity of the item when saved' do
    expect { cart_item.save }.to change { item.reload.stock_quantity }.by(-5)
  end
end