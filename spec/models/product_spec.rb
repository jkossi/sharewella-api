# frozen_string_literal: true

require "rails_helper"

RSpec.describe Product, type: :model do
  it "has a valid factory" do
    expect(build(:product)).to be_valid
  end

  context "when price is nil" do
    it "sets default value to zero" do
      expect(build(:product, price: nil).price_cents).to eq(0)
    end
  end

  context "when retail price is nil" do
    it "sets default value to zero" do
      expect(build(:product, retail_price: nil).retail_price_cents).to eq(0)
    end
  end

  describe "name validations" do
    it "is invalid if empty" do
      expect(build(:product, name: "")).not_to be_valid
    end
  end

  describe "retail price cents validation" do
    it "is not valid if it is less than zero" do
      expect(build(:product, price: -20)).not_to be_valid
    end

    it "is valid if it is greater than or equal to zero" do
      expect(build(:product, price: 0)).to be_valid
      expect(build(:product, price: 50)).to be_valid
    end
  end

  describe "price_cents validation" do
    it "is not valid if it is less than zero" do
      expect(build(:product, retail_price: -20)).not_to be_valid
    end

    it "is valid if it is greater than or equal to zero" do
      expect(build(:product, retail_price: 0)).to be_valid
      expect(build(:product, retail_price: 50)).to be_valid
    end
  end
end
