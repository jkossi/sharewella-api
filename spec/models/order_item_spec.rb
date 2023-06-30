require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  it "has a valid factory" do
    expect(build(:order_item)).to be_valid
  end
  
  describe "quantity validation" do
    it "is invalid if it is empty" do
      expect(build(:order_item, quantity: nil)).not_to be_valid
    end
    
    it "is invalid if it is zero" do
      expect(build(:order_item, quantity: 0)).not_to be_valid
    end
    
    it "is valid if it is greater than or equal to one" do
      expect(build(:order_item, quantity: 1)).to be_valid
    end
  end
end
