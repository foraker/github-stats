class SessionsController < ApplicationController
  before_filter :ensure_no_user, only: [:new, :create]

  def new; end

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to pull_requests_path, notice: 'Signed in!'
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Signed out.'
  end

  private

  def ensure_no_user
    redirect_to pull_requests_url if current_user.present?
  end
end
