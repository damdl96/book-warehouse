ActiveAdmin.register Store do
  menu priority: 4

  actions :index, :show
  filter :name

  show do
    panel 'Book inventories' do
      inventories = store.inventories.includes(:product)
      if inventories.present?
        table do
          thead do
            tr do
              ['Inventory id', 'quantity', 'book'].each(&method(:th))
            end
          end
          tbody do
            inventories.each do |inventory|
              tr do
                td link_to(inventory.id, admin_inventory_path(inventory.id))
                td inventory.quantity
                td link_to(inventory.product.title, admin_book_path(inventory.product_id))
              end
            end
          end
        end
      else
        "Store has no inventories."
      end
    end
  end
end
