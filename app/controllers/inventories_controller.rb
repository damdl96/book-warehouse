# frozen_string_literal: true

class InventoriesController < ApiController
  before_action :authenticate_user!

  def index
    inventories = map_inventories(Inventory.with_products(store_id: current_user.store_id))

    render json: inventories
  end

  def create
    inventory = Inventory.new(create_params)
    inventory.store_id = current_user.store_id

    response_handler(inventory)
  end

  def update
    inventory = Inventory.find(params[:id])
    if inventory.store_id == current_user.store_id
      inventory.assign_attributes(update_params)
      response_handler(inventory)
    else
      render json: '{"error": "not_found"}', status: :not_found
    end
  end

  private

  def response_handler(inventory)
    inventory.save!
    render json: map_inventories([inventory])
  rescue StandardError => e
    render json: { errors: e.message }, status: :bad_request
  end

  def map_inventories(inventories)
    inventories.map do |inv|
      {
        inventory_id: inv.id,
        quantity: inv.quantity,
        product: inv.product
      }
    end
  end

  def create_params
    params.require(:inventory).permit(:product_id, :product_type, :quantity)
  end

  def update_params
    params.require(:inventory).permit(:quantity)
  end
end
