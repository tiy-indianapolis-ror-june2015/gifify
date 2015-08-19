class GifsController < ApplicationController
  before_action :require_user, :only => [:new, :create]
  # protect_from_forgery :except => :create

  def index
    if params[:tag]
      @gifs = Gif.tagged_with(params[:tag]).order(:total_score => :desc).all
    elsif params[:user]
      @gifs = User.find_by_username(params[:user]).gifs.order(:total_score => :desc).all
    else
      @gifs = Gif.order(:total_score => :desc).all
    end
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end

  def show
    @gif = Gif.find(params[:id])
    render layout: false
  end

  def new
    @gif = Gif.new
    respond_to do |format|
      format.js{}
    end
  end

  def create
    @gif = Gif.new(gif_params)
    @gif.user = @current_user
    if @gif.save
      tags = params[:gif][:tags].split(",").collect(&:strip)
      tags.each do |tag|
        @gif.tags << Tag.new(:name => tag)
      end
      @gifs = Gif.order(:total_score => :desc).all.reject{|gif| gif.id == @gif.id}
      @gifs.unshift(@gif)
      respond_to do |format|
        format.js {}
      end
    else
      respond_to do |format|
        format.js { render :new }
      end
    end
  end

  private

  def gif_params
    params.require(:gif).permit(:image_url, :file)
  end

end
