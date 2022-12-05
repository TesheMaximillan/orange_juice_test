FactoryBot.define do
  factory :search_item do
    user { User.all.sample }
    text { "#{SecureRandom.hex(3)}?" }
    rank { rand(1..10) }
  end
end
