class GrammarController < ApplicationController
  def index
    @display_text = "grammar"
    @admin = is_admin?
  end
private
  def is_admin?
    return false
  end
end

