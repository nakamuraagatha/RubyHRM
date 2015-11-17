class RelationshipsController < ApplicationController
	before_action :require_admin
	before_action :set_relationship, only: [:edit, :update, :destroy]

	add_breadcrumb "Relationships", :relationships_path

	def index
		if params[:search]
			@relationships = Relationship.search(params[:search])
		else
			@relationships = Relationship.all
		end
		@count = @relationships.count
		@total_count = Relationship.count
	end

	def show
		add_breadcrumb "View Relationship", :relationship_path
	end

	def new
		add_breadcrumb "New Relationship", :new_relationship_path

		@relationship = Relationship.new
	end

	def create
		@relationship= Relationship.new(relationship_params)
		if @relationship.save
			flash[:success] = "Relationship has been successfully updated."
			redirect_to relationships_path
		else
			render "new"
		end
	end

	def edit
		add_breadcrumb "Edit Relationship", :edit_relationship_path
	end

	def update
		@relationship.update_attributes(relationship_params)
		if @relationship.save
			flash[:success] = "Relationship has been successfully updated."
			redirect_to relationships_path
		else
			render "edit"
		end
	end

	def destroy
		if @relationship.destroy
			flash[:success] = "Relationship has been successfully deleted."
			redirect_to relationships_path
		end
	end

	private
	def set_relationship
		@relationship = Relationship.find(params[:id])
	end

	def relationship_params
		params.require(:relationship).permit(:description)
	end
end
