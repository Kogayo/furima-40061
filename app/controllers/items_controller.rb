class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update]
  before_action :move_to_index, only: [:edit, :update]

  def index
    @items = Item.includes(:user).order('created_at DESC')
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

  def edit
  end

  def update 
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

    def move_to_index
      unless @item.user == current_user
        redirect_to root_path
      end
    end

  def item_params
    params.require(:item).permit(:image, :product_name, :product_description, :category_id, :condition_id, :prefecture_id, :shipping_day_id, :shipping_cost_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end


end