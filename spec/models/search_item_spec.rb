require 'rails_helper'

RSpec.describe SearchItem, type: :model do
  describe '#valid?' do
    it 'has a valid factory' do
      expect(build(:search_item)).to be_valid
    end

    it 'is invalid without a user' do
      expect(build(:search_item, user: nil)).to_not be_valid
    end

    it 'is invalid without text' do
      expect(build(:search_item, text: nil)).to_not be_valid
    end
  end
end
