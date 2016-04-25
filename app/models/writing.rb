class Writing < ActiveRecord::Base
  belongs_to :article
  has_many :remarks, dependent: :destroy
  def diff
    return level_to_text(self.rel_lvl)
  end
private
  def level_to_text(lvl)
    corr =
      ['newby', 'beginner', 'intermediate', 'advanced', 'hard']
    return corr[lvl]
  end
end
