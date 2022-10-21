# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { Faker::Book.unique.title }
    author { Faker::Book.unique.author }
    genre { Faker::Book.genre }
  end
end
