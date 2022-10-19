# frozen_string_literal: true

puts 'creating books...'
50.times do
  FactoryBot.create(:book)
end

puts 'creating stores...'
8.times do
  FactoryBot.create(:store)
end

books = Book.all
stores = Store.all

puts 'creating inventories...'
40.times do
  FactoryBot.create(:inventory, store: stores.sample, product: books.sample)
end

puts 'creating users...'
10.times do
  FactoryBot.create(:user, store: stores.sample)
end

Faker::UniqueGenerator.clear
puts '== seeds created successfully =='
