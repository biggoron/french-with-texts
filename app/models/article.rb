class Article < ActiveRecord::Base
  has_many :writings, dependent: :destroy
  validates :title, presence: true
end
