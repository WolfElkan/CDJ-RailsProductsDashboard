class ProductsController < ApplicationController

	def index
		@products = Product.all
	end

	def show
		@product = Product.find(params[:id])
		@comments = Comment.where(product_id: @product.id)
	end

	def new
		session.init product: Product.new, error: ""
		@categories = Category.all
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
		@categories = Category.all.to_a.collect do |category| 
			selectable category, @product.category_id == category.id ? "selected" : ""
		end
	end

	def update
		Product.find(params[:id]).update(product_params)
		redirect_to '/products'
	end

	def destroy
		Comment.where(product_id: params[:id])
		Product.delete(params[:id])
		redirect_to '/products'
	end

	def test
		x = Category.all.collect { |c| selectable c }
		x[2]['selected'] = "selected"
		render plain: x
		# render plain: Category.all[0].to_
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

private
def selectable category, selected
	{
		id:       category.id,
		name:     category.name,
		selected: selected
	}
end