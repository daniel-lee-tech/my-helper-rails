require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'shoulda matcher validations' do
    context 'new record with valid email' do
      subject { User.new(email: 'valid@email.com') }
      it { should validate_presence_of(:password_confirmation) }
      it { should validate_length_of(:password).is_at_least(9) }
      it { should validate_confirmation_of(:password) }
      it { should validate_uniqueness_of(:email) }
    end
  end

  describe 'custom validations' do
    describe '#valid_email' do
      it 'checks for valid email' do
        user = described_class.new(email: 'notvalid.email.com')
        user.validate
        expect(user.errors[:email]).to include("email is not a valid email")
      end
    end
  end

  it 'tests sorcery auth if it makes sense'
end
