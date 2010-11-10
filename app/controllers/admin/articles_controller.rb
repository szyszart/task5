class Admin::ArticlesController < ApplicationController
	before_filter :authenticate_admin!

        def index
                @search = Article.search(params[:search])
                @articles = @search.paginate(:page => params[:page], :per_page => articles_per_page) 
        end

        def create
                @article = Article.new(params[:article])
		@article.author_id = current_admin.id
		if @article.save
			redirect_to(admin_article_path(@article), :notice => 'Article was successfully created.')
		else
			@groups = Group.all
			render :action => :new
		end			
        end

        def new
                @article = Article.new
		@groups = Group.all
        end

        def show
		@article = Article.find(params[:id])
       end


	def edit
		@article = Article.find(params[:id])
		@groups = Group.all
	end

        def update
		@article = Article.find(params[:id])
		if @article.update_attributes(params[:article])
			redirect_to(admin_article_path(@article), :notice => 'Article was successfully updated.')
		else
			@groups = Group.all
			render :action => :edit
		end						
        end

        def destroy
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to(admin_articles_path, :notice => 'Article was successfully deleted.')
        end

	private
        def articles_per_page
                if params[:per_page]
                      session[:articles_per_page] = params[:per_page]
                end
                session[:articles_per_page]
        end
end
