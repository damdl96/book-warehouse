# frozen_string_literal: true

FactoryBot.define do
  factory :inventory do
    quantity { rand(0..100) }
  end
end
