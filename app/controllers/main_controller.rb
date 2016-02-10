class MainController < ApplicationController
  def index
    @display_text = "index"
    @admin = is_admin?
  end
  def contact
    @display_text = "contact"
    @admin = is_admin?
  end
private
  def is_admin?
    return false
  end
end
