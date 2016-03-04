class MainController < ApplicationController
http_basic_authenticate_with name: "admin",
                             password: "omelettedefromage",
                             only: [:admin_login, :admin_logout]
skip_before_action :adminness, only: [:admin_login, :admin_logout]
skip_before_action :require_admin, only: [:index, :contact, :admin_login, :admin_logout]
  def index
    @menu_item = "home-menu"
    render 'layouts/not_implemented'
  end
  def contact
    @menu_item = "contact-menu"
    render 'layouts/not_implemented'
  end
  def admin_login
    session[:user_type] = :admin
    redirect_to action: 'index'
  end
  def admin_logout
    session[:user_type] = :not_admin
    redirect_to action: 'index'
  end
private
  
end
