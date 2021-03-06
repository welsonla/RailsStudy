class SessionsController < ApplicationController
  def new
    
  end
  
  def create
  	user = User.find_by_email(params[:session][:email])
  	if user && user.authenticate(params[:session][:password])
	  	sign_in user 
	  	redirect_back_to user
  	else
  		flash[:error] = "invalid email/password combination"
  		render 'new'
  	end
  end
  
  def destroy
    redirect_to root_path
  end
end
