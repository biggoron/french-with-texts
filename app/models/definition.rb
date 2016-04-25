vlass Definition < ActiveRecord::Base
  validates :word, presence: true
  validates :translation, presence: true
  has_many :translations
end

