class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]

def index
  @items = Item.all
end

def new
  @item = Item.new
end

def create
  @item = Item.new(item_params) 

  if @item.valid?
    @item.save 
    redirect_to root_path
  else
    render :new
  end
end

def show
end

end

private

def move_to_index
  unless user_signed_in?
    redirect_to action: :index
  end
end

def item_params
  params.require(:item).permit(:image, :product_name, :product_description, :category_id, :condition_id, :prefecture_id, :shipping_day_id, :shipping_cost_id, :price).merge(user_id: current_user.id)
end



