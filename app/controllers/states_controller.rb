class StatesController < ApplicationController
	before_action :set_state, only: [:edit, :update, :destroy]
	before_action :require_admin

	def index
		if params[:search]
			@states = State.search(params[:search])
		else
			@states = State.all
		end
	end

	def new
		@state = State.new
	end

	def create
		@state = State.new(state_params)
		if @state.save
			flash[:success] = "State has been successfully created"
			redirect_to states_path
		end
	end

	def edit

	end

	def update
		if @state.update_attributes(state_params)
			flash[:success] = "State has been successfully updated"
			redirect_to states_path
		end
	end

	def destroy
		if @state.destroy
			flash[:success] = "State Level has been successfully deleted"
			redirect_to states_path
		end
	end

	private
		def set_state
			@state = State.find(params[:id])
		end

		def state_params
			params.require(:state).permit(:country_id, :state_code, :description)
		end
end
