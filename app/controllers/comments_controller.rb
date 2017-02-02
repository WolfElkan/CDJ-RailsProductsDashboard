class CommentsController < ApplicationController

	def index
		@comments = Comment.all
	end

	def create
		Comment.create(comment_params)
		redirect_to :back
	end

end

private
def comment_params
	{
		content: params[:content],
		product: Product.find(params[:product_id])
	}
end