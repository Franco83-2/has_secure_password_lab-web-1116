class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save && params[:user][:password] == params[:user][:password_confirmation]
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to action: 'new'
    end
  end

  def show
  end

  private

def user_params
  params.require(:user).permit(:name, :password)
end

end
