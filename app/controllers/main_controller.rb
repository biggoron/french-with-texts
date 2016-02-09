class MainController < ApplicationController
  def index
    @display_text = "index"
  end
  def vocabulary
    @display_text = "vocabulary"
    @admin = is_admin
  end
  def grammar
    @display_text = "grammar"
  end
  def lessons
    @display_text = "lessons"
  end
  def contact
    @display_text = "contact"
  end
private
  def is_admin
    return false
  end
end
