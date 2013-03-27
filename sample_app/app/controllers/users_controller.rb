class UsersController < ApplicationController
  
  #创建新用户界面
  def new
    @user = User.new
  end
  
  #插入新用户
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Sample App"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  #所有用户展示界面
  def show
    @user = User.find(params[:id])
  end
  
end
