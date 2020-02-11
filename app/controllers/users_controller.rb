class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if @user.save
      flash[:success] = "ユーザーを登録しました。"
    redirect to root_url
    else
      flash.now[:danger] = "ユーザーを登録できませんでした。"
    render :new
    end
  end

  def show
  end

  def index
  end
end
