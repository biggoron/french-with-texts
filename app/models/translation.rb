class Translation < ActiveRecord::Base
  validates :expression, presence: true
end


