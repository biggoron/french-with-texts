class Article < ActiveRecord::Base
  validates :title, presence: true
  # validates :filename, presence: true

  def full_path
  # returns the path to the text ressources of the article
    fp = 'texts/'
    fp << folder()
    fp << '/'
    fp << self.filename
    fp << ".html.erb"
  end

  def folder
    case self.layout
    when "lesson"
      'lessons'
    when "link"
      'links'
    when "resource"
      'resources'
    when "post"
      'posts'
    else
      'articles'
    end
  end
end
