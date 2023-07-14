# frozen_string_literal: true

require "rails_helper"

RSpec.describe BasketItem, type: :model do
  it "has a valid factory" do
    expect(build(:basket_item)).to be_valid
  end

  describe "product uniqueness" do
    it "allows a product to be added to the basket only once" do
      existing_basket_item = create(:basket_item)
      new_basket_item = build(:basket_item, basket: existing_basket_item.basket, product: existing_basket_item.product)
      expect(new_basket_item).not_to be_valid
    end

    it "allows multiple unique products to be added to the basket" do
      existing_basket_item = create(:basket_item)
      new_basket_item = build(:basket_item, basket: existing_basket_item.basket)
      expect(new_basket_item).to be_valid
    end
  end

  describe "basket quantity" do
    it "is not valid if it is less than one" do
      expect(build(:basket_item, quantity: 0)).not_to be_valid
    end
  end
end
