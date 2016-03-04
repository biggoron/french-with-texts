class ProjectsController < ApplicationController
skip_before_action :require_admin, only: [:index]
  def index
    @admin = is_admin?
    render 'layouts/not_implemented'
  end
private
  def is_admin?
    return false
  end
  def set_menu
    @menu_item = "projects-menu"
  end
end
