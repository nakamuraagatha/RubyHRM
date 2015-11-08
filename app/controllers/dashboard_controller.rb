class DashboardController < ApplicationController

	before_action :require_user

	def index
		@text_instruction = TextInstruction.find_by_key('instruction.dashboard')
	end
end
