class TodosController < ApplicationController
	before_action :logged_in_user
	before_action :all_todos, only: [:index, :create, :update, :destroy, :panel, :assigner]
	before_action :set_todos, only: [:edit, :update, :toggle, :destroy]

	before_action :admin_user, only: [:past, :index, :assign, :assigner]
	respond_to :html, :js

	def panel 
		# Main View for all users
		@todos = current_user.todos
		

	end

	# Admin Functions

	def past
		#All todos past their due date
		@todos = []
		Todo.all.each do |todo|
			if past_due(todo.due)
				@todos.push todo
			end
		end	
	end

	def index
		# Simply all todos for everyone
	end

	def assign
		# location to assign todos 
		@todo = Todo.new
		users_array = User.all 
		@users = []
		users_array.each do |user| 
			@users.push(["#{convert_user(user.id)}", user.id])
		end
	end

	def assigner
		@todo = Todo.new(todo_params)
		@todo.due = params[:todo][:due].to_date
		@todo.save
	end

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
			if current_user.admin?
				@todos = Todo.all
			else
				@todos = current_user.todos
			end
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
			params.require(:todo).permit(:task, :due, :done, :user_id)			
		end
end
