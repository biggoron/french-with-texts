class Backend::GrammarController < GrammarController
  http_basic_authenticate_with name: "frodo", password: "thering"

private
  def is_admin?
    return true
  end
end
