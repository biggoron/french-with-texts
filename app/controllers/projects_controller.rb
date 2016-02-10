class ProjectsController < ApplicationController
  def index
    @display_text = "projects"
    @admin = is_admin?
  end
private
  def is_admin?
    return false
  end
end
