class TextInstructionsController < ApplicationController
	before_action :set_text_instruction, only: [:show, :edit, :update, :destroy]
	before_action :require_admin

	add_breadcrumb "Instructions", :text_instructions_path

	def index
		if params[:search]
			@text_instructions = TextInstruction.search(params[:search])
		else
			@text_instructions = TextInstruction.all
		end

		@count = @text_instructions.count
		@total_count = TextInstruction.count
	end

	def edit
		add_breadcrumb "Edit Instruction", :edit_text_instruction_path
	end

	def update
		if @text_instruction.update(text_instruction_params)
			flash[:success] = "Instruction has been successfully updated"
			redirect_to text_instructions_path
		else
			render 'edit'
		end
	end

	def new
		add_breadcrumb "New Instruction", :new_text_instruction_path

		@text_instruction = TextInstruction.new
	end

	def create
		@text_instruction = TextInstruction.new(text_instruction_params)
		if @text_instruction.save
			flash[:success] = "Instruction has been added"
			redirect_to text_instructions_path
		else
			render 'new'
		end
	end

	def destroy
		if @text_instruction.destroy
			flash[:success] = "Instruction has been successfully deleted"
			redirect_to text_instructions_path
		end
	end

	private
	def set_text_instruction
		@text_instruction = TextInstruction.find(params[:id])
	end

	def text_instruction_params
		params.require(:text_instruction).permit(:key, :value)
	end
end
