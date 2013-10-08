class UsersController < ApplicationController

  def new
    # default: render 'new' template
  end


 def create
    
	    @user = User.create!(params[:user])
	    @id = @user[:user_id]
	    @email = @user[:email]
	    @verify = User.find_by_user_id(@id)
            
            if (@verify != nil) 
              flash[:notice] = 'Sorry, this id is taken.'
	      redirect_to new_user_path

           else 
		test = User::create_user!(@user)
          
     	 	
		flash[:notice] = "Welcome #{@id}.  Your account has been initialized."
            
      		redirect_to login_path
	   end
	  end
end
