require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#valid?' do
    it 'has a valid factory' do
      expect(build(:user)).to be_valid
    end

    it 'is invalid without a username' do
      expect(build(:user, username: nil)).to_not be_valid
    end

    it 'is invalid with a username that is too short' do
      expect(build(:user, username: 'a')).to_not be_valid
    end
  end
end
