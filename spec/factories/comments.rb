FactoryBot.define do
  factory :comment do
    content { "コメントの内容" }
    user
    shop
  end
end
