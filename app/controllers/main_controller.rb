class MainController < ApplicationController

# Defines admin account
http_basic_authenticate_with name: "admin",
                             password: "omelettedefromage",
                             only: [:admin_login]
# No need to be admin to login as admin
skip_before_action :adminness, only: [:admin_login, :admin_logout]
skip_before_action :require_admin, only: [:index, :contact, :admin_login, :admin_logout]
before_action :set_menu, only: [:index, :show]
  def index
    # Set the menu bullet
    @menu_item = "home-menu"
    @articles = Article.where(online: true, layout: "post")
    render 'layouts/home_page'
  end
  def contact
    # Set the menu bullet
    @menu_item = "contact-menu"
  end
  def admin_login
    # triggers the basic authenticate at the top of the page
    session[:user_type] = :admin
    # go back to the site with admin priviledges
    # trigger require_admin (defined in app controler) to
    # redirect to home page before action if not admin
    redirect_to action: 'index'
  end
  def admin_logout
    session[:user_type] = :not_admin
    redirect_to action: 'index'
  end
private
  def set_menu 
# See ActionController
    @menu_item = "home-menu"
  end
end
