class PostsController < ApplicationController

	http_basic_authenticate_with name: "gopal", password: "123", except: [:index, :show]
	
	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def show
		@post = Post.find(params[:id])
	end

	def create
		# The follwing command renders everything the controller received from the form.
		#render plain: params[:post].inspect

		@post = Post.new(post_params)

		if(@post.save)
			redirect_to @post
		else
			render 'new'
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

		if(@post.update(post_params))
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:id])

		if(@post.destroy)
			redirect_to @post
		else
			render 'show'
		end

	end


	private def post_params
		params.require(:post).permit(:title, :body)
	end

end
