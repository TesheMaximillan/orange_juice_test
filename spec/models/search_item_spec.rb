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

    it 'is invalid with text that is too short' do
      expect(build(:search_item, text: 'a?')).to_not be_valid
    end

    it 'is invalid with text that is too long' do
      expect(build(:search_item, text: 'a' * 200 + '?')).to_not be_valid
    end

    it 'is invalid with a duplicate text' do
      search_item = create(:search_item)
      expect(build(:search_item, text: search_item.text)).to_not be_valid
    end

    it 'is invalid without a rank' do
      expect(build(:search_item, rank: nil)).to_not be_valid
    end

    it 'is invalid with a rank that is not an integer' do
      expect(build(:search_item, rank: 1.5)).to_not be_valid
    end

    it 'is invalid with a rank that is less than 1' do
      expect(build(:search_item, rank: 0)).to_not be_valid
    end
  end

  describe '#capitalize_text' do
    it 'capitalizes the text' do
      search_item = create(:search_item, text: '  my seARch?')
      expect(search_item.text).to eq('My search?')
    end

    it 'removes whitespace' do
      search_item = create(:search_item, text: '  my seARch?  ')
      expect(search_item.text).to eq('My search?')
    end
  end

  describe '#text_must_be_a_question' do
    it 'is invalid with text that is not a question' do
      expect(build(:search_item, text: 'My search')).to_not be_valid
    end
  end
end
