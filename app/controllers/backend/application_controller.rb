class Backend::ApplicationController < ApplicationController::Base
  http_basic_authenticate_with name: "frodo", password: "thering"

  protect_from_forgery
end
