class AddVoteCacheToGifs < ActiveRecord::Migration
  def change
    add_column :gifs, :total_score, :integer
  end
end
