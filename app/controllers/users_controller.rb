class UsersController < ApplicationController

  def new
    @user = User.new()
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Your account information was updated successfully."
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User was created successfully."
      redirect_to articles_path
    else
      render :new, status: :unprocessable_entity
    end
  end


  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end