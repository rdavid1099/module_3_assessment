class Api::V1::ItemsController < ApplicationController
  before_action :set_item, only: [:show, :create, :destroy]
  def index
    @items = Item.all
  end

  def show
    if @item
      @item
    else
      item_not_found
    end
  end

  def destroy
    if @item
      @item.destroy
      render status: 200, json: {
        message: "Item successfully deleted",
      }.to_json
    else
      item_not_found
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      @item
    else
      render status: 404, json: {
        message: "Item not successfully saved",
      }.to_json
    end
  end

  private
    def item_params
      params.permit(:name, :description, :image_url)
    end

    def set_item
      @item = Item.find_by(id: params[:id])
    end

    def item_not_found
      render status: 404, json: {
        message: "Item not found",
      }.to_json
    end
end
