class SessionsController < ApplicationController
	def new

	end

	def destroy

	   #session[:session_token] = nil
	   #session[:login] = nil
           reset_session
	   redirect_to movies_path

	end

	def create

	   @user = params[:user]
	   @id = @user[:user_id]
           @email = @user[:email]

	   @user = User.find_by_user_id(@id)


	   if ((@user == nil) || (@email != @user.email))
	      flash[:notice] = 'Invalid user-id / email combination.'
              redirect_to login_path	      
	   else
		session[:session_token] = @user.session_token
		session[:login] = "You have logged in as #{@id}"
	        redirect_to movies_path           
	   end

	end
end
