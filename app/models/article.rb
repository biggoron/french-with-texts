class Article < ActiveRecord::Base
  has_many :writings, dependent: :destroy
  has_many :exercices, dependent: :destroy
  validates :title, presence: true
end
