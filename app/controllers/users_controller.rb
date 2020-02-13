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
    
  end
  
  def index
    
  end
  
  #Strong Parameter 
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
