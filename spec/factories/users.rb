FactoryBot.define do
  factory :user do
    username { SecureRandom.hex(3) }
  end
end
