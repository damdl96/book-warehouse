# frozen_string_literal: true

50.times do
  FactoryBot.create(:book)
end

8.times do
  FactoryBot.create(:store)
end

40.times do
  books = Book.all
  stores = Store.all
  FactoryBot.create(:inventory, store: stores.sample, book: books.sample)
end

Faker::UniqueGenerator.clear
