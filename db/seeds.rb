# frozen_string_literal: true

puts 'creating books...'
50.times do
  FactoryBot.create(:book)
end

puts 'creating stores...'
8.times do
  FactoryBot.create(:store)
end

puts 'creating inventories...'
40.times do
  books = Book.all
  stores = Store.all
  FactoryBot.create(:inventory, store: stores.sample, book: books.sample)
end

puts 'creating users...'
10.times do
  FactoryBot.create(:user)
end

Faker::UniqueGenerator.clear
puts '== seeds created successfully =='
