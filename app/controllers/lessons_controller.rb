class LessonsController < ApplicationController
skip_before_action :require_admin, only: [:index]
  def index
    render 'layouts/not_implemented'
  end
private
  def set_menu
    @menu_item = "lessons-menu"
  end
end
