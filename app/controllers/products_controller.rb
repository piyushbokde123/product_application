require 'httparty'

class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end
 
  def create
    @product = Product.new(product_params)

    if @product.save
      NotifyService.call(@product.name, params[:action])
      redirect_to root_path, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      NotifyService.call(@product.name, params[:action])
      redirect_to root_path, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  private
    def product_params
      params.require(:product).permit(:name, :price, :company, :quantity)
    end
end

