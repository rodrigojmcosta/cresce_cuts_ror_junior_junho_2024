require 'rails_helper'

RSpec.describe Cart, type: :model do
  it 'is valid with valid attributes' do
    expect(build(:cart)).to be_valid
  end

  it 'is not valid without a customer' do
    expect(build(:cart, customer: nil)).not_to be_valid
  end
end