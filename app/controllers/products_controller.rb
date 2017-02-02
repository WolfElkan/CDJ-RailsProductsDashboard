class ProductsController < ApplicationController

	def index
		@products = Product.all
	end

	def show
		@product = Product.find(params[:id])
	end

	def new
		session.init categories: Category.all, product: Product.new, error: ""
		@categories = session[:categories]
		@product    = session[:product]
		@error      = session[:error]
		# render plain: session[:categories][3]['id']
	end

	def create
		# If this were a larger application, I'd put this logic in the model
		# as validation, but I don't know how to render errors to the page.
		# Perhaps I'll do it on a supsequent commit.
		if Category.where(id:product_params[:category_id]).any?
			Product.create(product_params)
			session.clear
			redirect_to '/products'
		else
			session[:product] = product_params
			session[:error] = "Please select a Category"
			redirect_to '/products/new'
		end
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
