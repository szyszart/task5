class Admin::GroupsController < ApplicationController
	before_filter :authenticate_admin!
        def create
                @group = Group.new(params[:group])
		if @group.save
			redirect_to(admin_articles_path, :notice => 'Group was successfully created.')
		else
			render :action => "new"
		end			
        end

        def new
                @group = Group.new
        end

	def edit
		@group = Group.find(params[:id])
	end

        def update
		@group = Group.find(params[:id])
		if @group.update_attributes(params[:group])
			redirect_to(admin_articles_path, :notice => 'Group was successfully updated.')
		else
			render :action => "edit"
		end						
        end

        def destroy
		@group = Group.find(params[:id])
		@group.destroy
		redirect_to(admin_articles_path, :notice => 'Group was successfully deleted.')
        end
end
