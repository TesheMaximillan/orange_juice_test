FactoryBot.define do
  factory :search_item do
    user { User.first || create(:user) }
    text { 'MyString?' }
    rank { 1 }
  end
end
