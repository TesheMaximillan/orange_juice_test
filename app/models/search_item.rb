class SearchItem < ApplicationRecord
  belongs_to :user
  before_save :capitalize_text

  validates :text, presence: true, uniqueness: true, length: { minimum: 3, maximum: 200 }
  validates :rank, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  #Remove whitespace and capitalize text
  def capitalize_text
    self.text = text.strip.capitalize
  end
end
