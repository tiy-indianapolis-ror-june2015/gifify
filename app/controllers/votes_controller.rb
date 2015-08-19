class VotesController < ApplicationController
  before_filter :require_user

  def create
    @vote = Vote.find_or_initialize_by(:user_id => current_user.id, :gif_id => params[:gif_id])
    @vote.value = params[:value]
    @vote.save!
    @gif = @vote.gif
    @gifs = Gif.order(:total_score => :desc).all
    respond_to do |format|
      format.js {}
    end
  end

  private

  def vote_params
    params.permit(:gif_id, :value)
  end

end
