class UserSessionsController < ApplicationController

  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy

  def new
    @user_session = UserSession.new
    respond_to do |format|
      format.js {}
    end
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      @current_user = @user_session.record
      @current_user_session = @user_session.id
      respond_to do |format|
        format.html {
          flash[:notice] = "Login successful!"
          redirect_back_or_default account_url
        }
        format.js{}
      end
    else
      render :action => :new
    end
  end

  def destroy
    current_user_session.destroy
    @current_user = nil
    respond_to do |format|
      format.html{
        flash[:notice] = "Logout successful!"
        redirect_back_or_default new_user_session_url
      }
      format.js {}
    end
  end

  private

  def session_params
    params.require(:user_session).permit(:username, :password, :remember_me)
  end

end
