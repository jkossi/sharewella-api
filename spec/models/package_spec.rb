# frozen_string_literal: true

require "rails_helper"

RSpec.describe Package, type: :model do
  it "has a valid factory" do
    expect(build(:package)).to be_valid
  end

  describe "name validations" do
    it "is invalid if empty" do
      expect(build(:package, name: "")).not_to be_valid
    end
  end
end
