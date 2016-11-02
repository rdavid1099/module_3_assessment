class Api::V1::ItemsController < ApplicationController
  def index
    items = Item.all
    render json: items
  end

  def show
    item = Item.find_by(id: params[:id])
    if item
      render json: item
    else
      item_not_found
    end
  end

  def destroy
    item = Item.find_by(id: params[:id])
    if item

    else
      item_not_found
    end
  end

  private
    def item_not_found
      render status: 404, json: {
        message: "Item not found",
      }.to_json
    end
end
