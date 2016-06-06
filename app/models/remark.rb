class Remark < ActiveRecord::Base
  belongs_to :writing
  validates  :title,       presence:  true
  validates  :writing_id,  presence:  true
end
