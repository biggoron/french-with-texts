class EventsController < ApplicationController
  def index
    @display_text = "events"
    @admin = is_admin?
  end
private
  def is_admin?
    return false
  end
end

