require 'spec_helper'

describe ArticlesController do
	describe "index" do
		it "should render index template" do
			get :index			
			response.should render_template("index")
		end
	end

	describe "show" do
		before(:each) do
			@group = Group.create(:name => "test group")
			@article = Article.create(:title => "Example article", 
				:content => "Test content",
				:group_id => @group.id)
		end

		it "should render show template" do
			get :show, :id => @article.id
			response.should render_template("show")
		end
	end

end
