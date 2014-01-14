class PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update, :destroy]

	def index
		@posts = Post.all
		@comment = Comment.all
	end

	def show
		@comment = Comment.new
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.create(post_params)
		redirect_to post_path(@post)
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		@post.update_attributes(post_params)
		redirect_to post_path
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to "/posts"
	end

private

	def set_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :content)
	end

end