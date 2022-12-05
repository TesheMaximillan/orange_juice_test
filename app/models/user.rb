class User < ApplicationRecord
  has_many :search_items
  before_save :capitalize_name

  validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 20 }

  #Remove whitespace and capitalize name
  def capitalize_name
    self.username = username.strip.capitalize
  end
end
