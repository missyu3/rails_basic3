class UsersController < ApplicationController
  skip_before_action :login_required
  before_action  :find_user, only:[:show, :edit, :update]
  def new
    @user = User.new
  end

  def create
    @user = User.new(get_parms)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render :new
    end 
  end

  def edit;  end

  def update
    params[:user].delete("password")
    if @user.update(get_parms)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def index
    @users = User.all
  end

  def show;  end

  private  
  def find_user
    @user = User.find(params[:id])
  end

  def get_parms
    params.require(:user).permit(:name, :email, :image, :profile, :password, :password_confirmation)
  end
end
