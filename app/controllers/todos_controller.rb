class TodosController < ApplicationController
	before_action :all_todos, only: [:index, :create, :update, :destroy]
	before_action :set_todos, only: [:edit, :update, :destroy]
	respond_to :html, :js

	def index 
		
	end

	def new
		@todo = Todo.new		
	end

	def create
		@todo = Todo.create(todo_params)
	end

	def update
		@todo.update_attributes(todo_params)
	end

	def destroy
		@todo.destroy
	end

	private 
		def all_todos
			@todos = Todo.all
		end

		def set_todos
			@todo = Todo.find(params[:id])
		end

		def todo_params
			params.require(:todo).permit(:task, :due)			
		end
end
