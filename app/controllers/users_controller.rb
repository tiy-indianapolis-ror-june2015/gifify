class UsersController < ApplicationController

  def new
    @user = User.new
    respond_to do |format|
      format.js {}
    end
  end

  def create
    @user = User.new(user_params)
    @user.approved = true
    @user.confirmed = true
    @user.active = true
    if @user.save
      @current_user = @user
      @current_user_session = UserSession.create(@user)
      respond_to do |format|
        format.js {}
      end
    else
      respond_to do |format|
        format.js { render :new }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
