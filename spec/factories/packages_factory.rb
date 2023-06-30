FactoryBot.define do
  factory :package do
    creator factory: :user
    name { 'Jumbo size Indomie' }
  end
end
