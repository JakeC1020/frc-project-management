class TodosController < ApplicationController
	before_action :all_todos, only: [:index, :create, :update, :destroy]
	before_action :set_todos, only: [:edit, :update, :toggle, :destroy]
	before_action :logged_in_user
	before_action :admin_user, only: [:past, :index, :assign]
	respond_to :html, :js

	def panel 
		# Main View for all users
		if current_user.admin?
			@todos = Todo.all
		else
			@todos = current_user.todos
		end
	end
=begin
	# Admin Functions

	def past
		#All todos past their due date

	end

	def index
		# Simply all todos for everyone

	end

	def assign
		# location to assign todos 

	end
=end
	# CRUD Actions

	def new
		# Ajax function
		@todo = Todo.new
	end

	def create
		# Ajax function
		@todo = current_user.todos.create(todo_params)
	end

	def update
		# Ajax function
		@todo.update_attributes(todo_params)
	end

	def destroy
		# Ajax function
		@todo.destroy
	end

	private 
		def all_todos
			@todos = Todo.all
		end

		def set_todos
			@todo = Todo.find(params[:id])
		end

		def logged_in_user
	      unless logged_in?
	      	flash[:danger] = "Please log in."
	        redirect_to login_url
	      end
	    end

	    def admin_user
	    	unless current_user.admin?
	    		redirect_to(root_url)
	    	end
	    end

		def todo_params
			params.require(:todo).permit(:task, :due, :done)			
		end
end
