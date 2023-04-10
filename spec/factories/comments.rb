FactoryBot.define do
  factory :comment do
    content { "MyText" }
    user { nil }
    shop { nil }
  end
end
