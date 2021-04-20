# frozen_string_literal: true

RSpec.describe Pet do
  let(:pet) { build(:pet) }

  it "has a valid factory" do
    expect(pet.valid?).to eq(true)
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:kind) }
    it { is_expected.to allow_value(:cat).for(:kind) }
    it { is_expected.to allow_value(:dog).for(:kind) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:owner) }
  end
end
