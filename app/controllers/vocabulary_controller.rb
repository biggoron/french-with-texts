class VocabularyController < ApplicationController
  def index
    @admin = is_admin?
    render 'layouts/not_implemented'
  end
private
  def is_admin?
    return false
  end
end

