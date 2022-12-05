FactoryBot.define do
  factory :search_item do
    user { nil }
    text { "MyString" }
    rank { 1 }
  end
end
