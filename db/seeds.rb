# frozen_string_literal: true

puts "\n== Seeding database =="

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
100.times do
  inv = FactoryBot.build(:inventory, store: stores.sample, product: books.sample)
  inv.save! if inv.valid?
end

puts 'creating users...'
10.times do
  FactoryBot.create(:user, store: stores.sample)
end

Faker::UniqueGenerator.clear
puts "COMPLETED"
