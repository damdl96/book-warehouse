# frozen_string_literal: true

ActiveAdmin.register Inventory do
  menu priority: 2
  actions :index, :show, :delete

  filter :store, as: :select
end
