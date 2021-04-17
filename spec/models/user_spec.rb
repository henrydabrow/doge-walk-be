# frozen_string_literal: true

RSpec.describe User do
  let(:user) { build(:user) }

  it "has a valid factory" do
    expect(user.valid?).to eq(true)
  end

  describe "validations" do
    context "when vaildates email" do
      it { is_expected.to allow_values("xy@gmail.com").for(:email) }
      it { is_expected.not_to allow_value("gmail.com").for(:email) }
      it { is_expected.to validate_presence_of(:email) }
    end

    context "when vaildates password" do
      it { is_expected.to validate_presence_of(:password) }
      it { is_expected.to validate_confirmation_of(:password) }
      it { is_expected.to validate_length_of(:password).is_at_least(8) }
      it { is_expected.to allow_values("Password1!").for(:password) }
      it { is_expected.to_not allow_values(
        "password1!",
        "Password!",
        "Password1",
        "password1!").for(:password) }
      it { is_expected.to have_secure_password }
    end

    describe "uniqueness" do
      before { user.save }

      it { is_expected.to validate_uniqueness_of(:email) }
    end
  end
end
