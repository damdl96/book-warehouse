ActiveAdmin.register Book do
  menu priority: 3

  actions :index, :show
  filter :title
  filter :genre, as: :select, collection: -> { Book.genres }

  index do
    id_column
    column :title
    column :author
    column :genre
  end

  show do
    attributes_table do
      row :title
      row :author
      row :genre
    end

    panel 'Inventories' do
      inventories = book.inventories.eager_load(:store)
      if inventories.present?
        table do
          thead do
            tr do
              ['Inventory id', 'quantity', 'store'].each(&method(:th))
            end
          end
          tbody do
            inventories.each do |inventory|
              tr do
                td link_to(inventory.id, admin_inventory_path(inventory.id))
                td inventory.quantity
                td link_to(inventory.store.name, admin_store_path(inventory.store.id))
              end
            end
          end
        end
      else
        "Book has no inventories."
      end
    end
  end
end
