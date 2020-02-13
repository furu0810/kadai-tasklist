class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "ユーザーを登録しました。"
    redirect_to login_url
    else
      flash.now[:danger] = "ユーザーを登録できませんでした。"
    render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end
  
  def index
    @users = User.order(id: :desc).page(params[:page]).per(25)
  end
  
  #Strong Parameter 
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
