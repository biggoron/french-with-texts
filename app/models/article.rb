class Article < ActiveRecord::Base
  has_many :writings, dependent: :destroy
# has_many :commentaries, dependent: :destroy
  validates :title, presence: true
end
