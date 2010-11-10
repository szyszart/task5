class Admin::CommentsController < ApplicationController
	before_filter :authenticate_admin!

	def new
		@comment = Article.find(params[:article_id]).comments.new
		@articles = Article.all
	end

	def create
		article = Article.find(params[:article_id])
		@comment = article.comments.new(params[:comment])
		if @comment.save
			redirect_to admin_article_path(@comment.article)
		else			
			render :action => "new"
		end
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to admin_article_path(@comment.article)
	end
end
