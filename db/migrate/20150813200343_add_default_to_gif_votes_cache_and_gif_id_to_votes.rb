class AddDefaultToGifVotesCacheAndGifIdToVotes < ActiveRecord::Migration
  def change
    change_column :gifs, :total_score, :integer, :default => 0
    add_column    :votes, :gif_id, :integer
  end
end
