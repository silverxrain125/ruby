class UsersController < ApplicationController
	def new
		@users = User.all
	end

	def create
		@user = User.new(user_params)

		if @user.save
			session[:user_id] = @user.id
			redirect_to '/events'
		else
			flash[:errors]=@user.errors.full_messages
			redirect_to :back
		end
	end

	def show
		@my_state_events = Event.all.where(state: current_user.state)
	end

	def edit
		@user= current_user
	end

	def update
		@user_update = User.find(params[:id])
		
		if @user_update.update(user_params)
			redirect_to '/events'
		else
			flash[:errors]=@user.errors.full_messages
			redirect_to :back
		end
	end


	private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :location, :state, :password)
	end


end
