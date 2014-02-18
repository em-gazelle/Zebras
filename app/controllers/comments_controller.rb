class CommentsController < ApplicationController
	def new
		@comment = Comment.new
	end	
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(params[:comment])
		redirect_to post_path(@post)
	end
	def edit
		@comment = Comment.find(params[:post_id])
		@comment = @post.comments.update(params[:comment])
		redirect_to post_path(@post)
	end
	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post)
	end
end 