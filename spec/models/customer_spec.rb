require 'rails_helper'

RSpec.describe Customer, type: :model do
  it 'is valid with valid attributes' do
    expect(build(:customer)).to be_valid
  end

  it 'is not valid without a name' do
    expect(build(:customer, name: nil)).not_to be_valid
  end

  it 'is not valid without an email' do
    expect(build(:customer, email: nil)).not_to be_valid
  end

  it 'is not valid without an address' do
    expect(build(:customer, address: nil)).not_to be_valid
  end

  it 'is not valid with a duplicate email' do
    create(:customer, email: "duplicate@example.com")
    expect(build(:customer, email: "duplicate@example.com")).not_to be_valid
  end
end