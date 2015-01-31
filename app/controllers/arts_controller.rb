class ArtsController < ApplicationController
  before_action :set_art, only: [:show, :edit, :update, :destroy]
  before_action :authorized_user, only: [:edit, :update, :destroy]
  before_filter :authenticate_user!, :except => [:index, :show]

  respond_to :html

  def index
    @arts = Art.all
    @latests = Art.order('updated_at DESC')
    @artists = Profile.all
    respond_with(@arts)
  end

  def show
    @other_works = @art.user.art
    respond_with(@art)
  end

  def new
    @art = Art.new
    respond_with(@art)
  end

  def edit
  end

  def create
    @art = Art.new(art_params)
    @art.user = current_user
    @art.save
    respond_with(@art)
  end

  def update
    @art.update(art_params)
    respond_with(@art)
  end

  def destroy
    @art.destroy
    respond_with(@art)
  end

  def authorized_user
    @art = current_user.art.find_by(id: params[:id])
    redirect_to arts_path, notice: "Not authorized to edit this link" if @art.nil?
  end


  private
    def set_art
      @art = Art.find(params[:id])
    end

    def art_params
      params.require(:art).permit(:title, :description, :image, :artwork)
    end
end
