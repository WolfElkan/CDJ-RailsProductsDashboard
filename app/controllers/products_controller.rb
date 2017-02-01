class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
  end

  def create
    Product.create(product_params)
    redirect_to '/products'
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    Product.find(params[:id]).update(product_params)
    redirect_to '/products'
  end

  def destroy
    Product.delete(params[:id])
    redirect_to '/products'
  end

end

  private
  def product_params
    {
      name:        params[:name],
      description: params[:description],
      price:       params[:price]
    }
  end
