# frozen_string_literal: true

require "rails_helper"

RSpec.describe PhoneNumberVerification, type: :model do
  it "has a valid factory" do
    expect(build(:phone_number_verification)).to be_valid
  end

  describe "validations" do
    subject { build(:phone_number_verification, user: build(:user)) }

    it { is_expected.to validate_presence_of(:phone_number) }
    it { is_expected.to validate_uniqueness_of(:phone_number).case_insensitive }
    it { is_expected.to validate_uniqueness_of(:user_id) }

    describe "#phone_number_normalized" do
      let(:phone_number_verification) { build(:phone_number_verification, phone_number: "0540000000") }

      it "normalizes phone number using +233 as default country code" do
        expect(phone_number_verification).to be_valid
        expect(phone_number_verification.phone_number_normalized).to eq("+233540000000")
      end

      it "is invalid if it contains only alphabets" do
        phone_number_verification.phone_number = "abcdeftghy"

        expect(phone_number_verification).not_to be_valid
      end

      it "does not allow an invalid Ghanaian number" do
        phone_number_verification.phone_number = "01234567890"

        expect(phone_number_verification).not_to be_valid
        expect(phone_number_verification.errors.messages[:phone_number_normalized]).to include("is an invalid number")
      end
    end
  end

  describe "associations" do
    it { is_expected.to belong_to(:user).optional }
  end
end
