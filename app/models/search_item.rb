class SearchItem < ApplicationRecord
  belongs_to :user
  before_save :capitalize_text

  validates :text, presence: true,
                   length: { minimum: 3, maximum: 200, message: 'Text must be between 3 and 200 characters' }
  validates :rank, presence: true,
                   numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validate :text_must_be_a_question

  # Remove whitespace and capitalize text
  def capitalize_text
    self.text = text.strip.capitalize
  end

  def text_must_be_a_question
    errors.add(:text, 'Text must be a question') if text.present? && !text.strip.end_with?('?')
  end
end
