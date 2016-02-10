class VocabularyController < ApplicationController
  def index
    @display_text = "vocabulary"
    @admin = is_admin?
  end
private
  def is_admin?
    return false
  end
end

