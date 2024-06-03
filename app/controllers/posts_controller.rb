class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def new
	    @post = Post.new		
	end

	def create
		@post = Post.new(post_params)
		if @post.save   
			redirect_to root_path, notice: "Post Successfully Added"
		else
		   render :new, status: :unprocessable_entity
		end	
	end

	private

	def post_params
		params.require(:post).permit(:title, :body,:user_id)		
	end
end
