class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # Checks before each action if the user is admin
  before_action :adminness
  # The menu on the left of the website is updated before
  # each action
  before_action :set_menu
  # By default, each controller's action is restrained to
  # admin usage
  before_action :require_admin

  # By default each basic controller's action redirects to
  # home page
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
  # Checks if the user is admin and sets @admin
    if session[:user_type] == 'admin'
      @admin = true
    else
      @admin = false
    end
  end
  def set_menu
    # I guess it set the menu on home page by default
    # What's that?!?!
    @menu_item = "caca-menu"
  end
  def require_admin
    # If the user is not admin, he is redirected to home page
    unless session[:user_type] == 'admin'
      redirect_to root_path
    end
  end
end
