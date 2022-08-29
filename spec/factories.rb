# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { '112233' }
  end

  factory :message do
    content { Faker::Lorem.paragraph(sentence_count: 2) }
  end

  factory :recieved_message do
    user
    message
  end
end
