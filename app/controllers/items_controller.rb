class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)

    @item.save
  end

  private
    def item_params
      params.require(:item).permit(:name)
    end
end
