class Backend::EventsController < EventsController
http_basic_authenticate_with name: "frodo", password: "thering"

private
  def is_admin?
    return false
  end
end
