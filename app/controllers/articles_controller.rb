class ArticlesController < ApplicationController
        def index
		@search = Article.search(params[:search])
		@articles = @search.paginate(:page => params[:page], :per_page => articles_per_page)
        end

        def show
		@article = Article.find(params[:id])
		@group_name = @article.get_group_name
        end

	private
	def articles_per_page
		if params[:per_page]
		      session[:articles_per_page] = params[:per_page]
		else
		      session[:articles_per_page] = Article.per_page		      
    		end
		session[:articles_per_page]
	end
end

