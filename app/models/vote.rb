class Vote < ActiveRecord::Base

  belongs_to :user
  belongs_to :gif

  after_save :update_total_cache

  def update_total_cache
    self.gif.update!(:total_score => self.class.total_score(self.gif))
  end

  def self.total_score(this_gif)
    this_gif.votes.sum(:value)
  end
end
