class UsersController < ApplicationController
  
  def new
    # @user = User.new(name: "Example User",
    #                 email: "user@example.com",
    #                 password: "foobar",
    #                 password_confirmation: "foobar")
    
  end
  
  def show
    @user = User.find(params[:id])
  end
  
end
