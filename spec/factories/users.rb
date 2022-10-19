# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { Faker::Name.unique.first_name }
    last_name { Faker::Name.unique.last_name }
    sequence(:email) { |n| "test#{n}@testemail.com" }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
