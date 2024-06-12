require 'rails_helper'

RSpec.describe Store, type: :model do
  it 'is valid with valid attributes' do
    expect(build(:store)).to be_valid
  end

  it 'is not valid without a name' do
    expect(build(:store, name: nil)).not_to be_valid
  end

  it 'is not valid without an address' do
    expect(build(:store, address: nil)).not_to be_valid
  end
end