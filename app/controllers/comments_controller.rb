class CommentsController < ApplicationController

	def create
		@comment = Comment.create(comment_params)
		@comment.post = Post.find(params[:post_id])
		# 'params' is referring to unstrong params
		@comment.save
		redirect_to @comment.post

	end

	def destroy
		Comment.all.destroy
	end

	private
	def comment_params
		params.require(:comment).permit(:content)
	end

end