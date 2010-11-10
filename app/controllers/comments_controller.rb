class CommentsController < ApplicationController
	def new
		@comment = Article.find(params[:article_id]).comments.new
	end

	def create
		article = Article.find(params[:article_id])
		@comment = article.comments.new(params[:comment])
		if @comment.save
			redirect_to article
		else
			render :action => "new"
		end
	end
end
