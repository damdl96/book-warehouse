# frozen_string_literal: true

50.times do
  FactoryBot.create(:book)
end

8.times do
  FactoryBot.create(:store)
end

Faker::UniqueGenerator.clear
