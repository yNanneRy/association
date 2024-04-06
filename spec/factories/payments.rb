FactoryBot.define do
  factory :payment do
    person { nil }
    amount { 1.5 }
    paid_at { "2024-04-05" }
  end
end
