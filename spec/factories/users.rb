FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "User #{n}" }
    sequence(:email) { |n| "user#{n}@example.com" }
    password { "password" }
    profile { "My profile" }
    after(:create) do |user|
      user.avatar.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'images', 'avatar.png')), filename: 'avatar.png',
                         content_type: 'image/png')
    end
  end
end
