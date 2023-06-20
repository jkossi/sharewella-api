# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end

  describe 'name validations' do
    it 'is valid if it contains only these special characters(.-)' do
      expect(build(:user, name: 'Joseph. Arthur-M')).to be_valid
    end

    it 'is invalid if it contains numbers' do
      expect(build(:user, name: 'Joseph Abc1234')).not_to be_valid
    end

    it 'is invalid if it contains any other special characters except spaces and (.-)' do
      expect(build(:user, name: 'Joseph A@_^&')).not_to be_valid
    end
  end

  describe 'pin validations' do
    it 'is invalid if length is less than 4 digits' do
      expect(build(:user, pin: '12')).not_to be_valid
    end

    it 'is invalid if length is greater than 4 digits' do
      expect(build(:user, pin: '12647')).not_to be_valid
    end

    it 'is valid if length is equal to 4 digits' do
      expect(build(:user, pin: '1264')).to be_valid
    end

    it 'is invalid if it contains alphabets' do
      expect(build(:user, pin: '123A')).not_to be_valid
    end

    it 'is invalid if all 4 digits are same' do
      expect(build(:user, pin: '0000')).not_to be_valid
    end

    it 'is invalid if it is empty' do
      expect(build(:user, pin: '')).not_to be_valid
    end

    it 'is valid if it is nil' do
      expect(build(:user, pin: nil)).to be_valid
    end
  end

  describe 'email validations' do
    it "is invalid if it's empty" do
      expect(build(:user, email: '')).not_to be_valid
    end

    it "is valid if it's nil" do
      expect(build(:user, email: nil)).to be_valid
    end

    it 'strips white spaces and transforms email to lowercase before saving' do
      user = build(:user, email: '  JOSEPH@YAHOO.COM ')
      user.valid?

      expect(user.email).to eq('joseph@yahoo.com')
    end

    it 'does not allow an invalid email' do
      expect(build(:user, email: 'jamel@gmail')).not_to be_valid
    end

    describe 'uniqueness' do
      let(:email) { 'joseph@yahoo.com' }
      let!(:existing_user) { create(:user, phone_number: '0547000000', email: email) }

      it 'does not allow two users to have the same email' do
        new_user = build(:user, email: email)

        expect(new_user).not_to be_valid
      end

      it 'does a case insensitive uniqueness validation' do
        new_user = build(:user, email: ' JOSEPH@Yahoo.COM')

        expect(new_user).not_to be_valid
        expect(new_user.errors.messages[:email]).to include('has already been taken')
      end

      it 'ignores validations if email is nil' do
        existing_user.update(email: nil)

        expect { create(:user, phone_number: '0547000001', email: nil) }.to change(User, :count).from(1).to(2)
      end

      context 'when a user is soft deleted' do
        before { existing_user.discard }

        it 'ignores soft deleted users' do
          new_user = build(:user, email: email)

          expect(new_user).to be_valid

          new_user.save

          expect(new_user.reload).to have_attributes(email: email, phone_number: '0201337888')
        end
      end
    end
  end

  describe 'phone number validations' do
    let(:user) { build(:user, phone_number: '0540000000') }

    it 'does not allow blank phone numbers' do
      user.phone_number = '  '

      expect(user).not_to be_valid
    end

    it 'saves the phone number without the country code' do
      user.save

      expect(user.reload.phone_number).to eq('0540000000')
    end

    describe 'uniqueness' do
      it 'does not allow two users to have the same phone number' do
        user.save
        new_user = build(:user, phone_number: user.phone_number)

        expect(new_user).not_to be_valid
        expect(new_user.errors.messages[:phone_number]).to include('has already been taken')
      end

      context 'when a user is soft deleted' do
        before do
          user.save
          user.discard
        end

        it 'ignores soft deleted users' do
          new_user = build(:user, phone_number: user.phone_number)

          expect(new_user).to be_valid

          new_user.save

          expect(new_user.reload).to have_attributes(phone_number: user.phone_number)
        end
      end
    end

    describe '#phone_number_normalized' do
      it 'normalizes phone number using +233 as default country code' do
        expect(user).to be_valid
        expect(user.phone_number_normalized).to eq('+233540000000')
      end

      it 'is invalid if it contains only alphabets' do
        user.phone_number = 'abcdeftghy'

        expect(user).not_to be_valid
      end

      it 'does not allow an invalid Ghanaian number' do
        user.phone_number = '01234567890'

        expect(user).not_to be_valid
        expect(user.errors.messages[:phone_number_normalized]).to include('is an invalid number')
      end
    end
  end
end
