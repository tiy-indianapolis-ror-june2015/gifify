class User < ActiveRecord::Base

  acts_as_authentic
  has_many  :gifs
  has_many  :votes


  def vote(gif)
    votes.where(:gif_id => gif.id).first
  end

  def liked?(gif)
    vote(gif) && vote(gif).value > 0
  end

  def disliked?(gif)
    vote(gif) && vote(gif).value < 0
  end

end
