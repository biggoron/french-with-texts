class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :adminness
  before_action :require_admin

  def index
    redirect_to root_path
  end

  def show
    redirect_to root_path
  end

  def new
    redirect_to root_path
  end

  def create
    redirect_to root_path
  end

  def edit
    redirect_to root_path
  end

  def update
    redirect_to root_path
  end

  def destroy
    redirect_to root_path
  end

  def adminness
    if session[:user_type] == 'admin'
      @admin = true
    else
      @admin = false
    end
  end
  def require_admin
    unless session[:user_type] == 'admin'
      redirect_to root_path
    end
  end
end
