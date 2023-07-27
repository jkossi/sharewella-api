# frozen_string_literal: true

require "rails_helper"

RSpec.describe Basket, type: :model do
  it "has a valid factory" do
    expect(build(:basket)).to be_valid
  end

  describe "user uniqueness" do
    it "does not allow a user to have more than one basket" do
      exisiting_basket = create(:basket)
      new_basket = build(:basket, user: exisiting_basket.user)

      expect(new_basket).not_to be_valid
    end
  end
end
