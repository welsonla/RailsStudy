class UsersController < ApplicationController
  
  before_filter :signed_in_user, only: [:edit, :update]
  before_filter :correct_user , only: [:edit, :update]
  
  
  def index
    @users = User.all
  end
  
  
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
  
  
  
  #编辑用户资料
  def edit
    @user = User.find(params[:id])
  end
  
  
  def update
    @user = User.find(params[:id])
    
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end 
  end
  
  
  
  private 
  
  def signed_in_user
    redirect_to signin_path, notice: "please sign in." unless signed_in?
  end
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end
  
end
