class User < ApplicationRecord
  has_many :search_items

  validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 20 }
end
