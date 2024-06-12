require 'rails_helper'

RSpec.describe Item, type: :model do
  it 'is valid with valid attributes' do
    expect(build(:item)).to be_valid
  end

  it 'is not valid without a name' do
    expect(build(:item, name: nil)).not_to be_valid
  end

  it 'is not valid without a price' do
    expect(build(:item, price: nil)).not_to be_valid
  end

  it 'is not valid without stock quantity' do
    expect(build(:item, stock_quantity: nil)).not_to be_valid
  end
end