class Article < ActiveRecord::Base
  validates :title, presence: true

  def full_path
  # returns the path to the text ressources of the article
    fp = Rails.root.to_s
    fp << '/app/views/texts/articles/'
    fp << self.normalize
    fp << '/'
  end
end
