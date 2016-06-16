class Writing < ActiveRecord::Base
  belongs_to  :article
  has_many    :remarks,  dependent:  :destroy
  def diff
  # returns the difficulty of the writing written in text
    return level_to_text(self.rel_lvl)
  end
  validates :rel_lvl, presence: true
private
  def level_to_text(lvl)
    corr =
      ['newby', 'beginner', 'intermediate', 'advanced', 'hard']
    return corr[lvl]
  end
end
