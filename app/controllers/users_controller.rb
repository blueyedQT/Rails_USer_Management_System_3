class UsersController < ApplicationController
	layout "two_column"
	def index
		@users = User.all
	end

	def new
		@errors = flash[:errors]
	end

	def create
		@user = User.new( first_name: params[:first_name], last_name: params[:last_name], email_address: params[:email_address], password: params[:password])
		if @user.valid?
			@user.save
			redirect_to '/users'
		else
			flash[:errors] = @user.errors.full_messages
			redirect_to '/users/new'
		end
	end
end
