require 'rails_helper'

RSpec.describe SearchItem, type: :model do
  describe '#valid?' do
    it 'has a valid factory' do
      expect(build(:search_item)).to be_valid
    end
  end
end
