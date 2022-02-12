class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create

  end

  def show

  end

  def index

  end

  def edit

  end

  def update

  end

private

  def item_params
    params.require(:item).permit(:image_id, :name, :introduction, :price)
  end

end
