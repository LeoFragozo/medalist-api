FactoryBot.define do
  factory :medal do
    kind { "Silver" }
    competition { "Skateboarding" }
    athlete
  end
end
