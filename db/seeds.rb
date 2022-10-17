# frozen_string_literal: true

50.times do
  Book.create!(title: Faker::Book.unique.title,
               author: Faker::Book.unique.author,
               genre: Faker::Book.genre)
end
Faker::UniqueGenerator.clear
