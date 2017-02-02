class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @categories = Category.all
  end

  def create
    # puts product_params
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
      price:       params[:price],
      category_id: params[:category_id]
    }
  end
