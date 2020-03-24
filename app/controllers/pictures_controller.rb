class PicturesController < ApplicationController
  before_action :find_params_object, only:[:edit, :update, :show, :destroy]
  before_action :link_current_user, only:[:create, :confirm]

  def index
    @pictures = Picture.all
  end

  def new
    if params[:back]
      @picture = link_current_user
    else
      @picture = Picture.new
    end
  end

  def create
    if @picture.save
      redirect_to pictures_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @picture.update(get_params)
      redirect_to pictures_path, notice:"編集しました"
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    if @picture.destroy
      redirect_to pictures_path, notice:"削除しました"
    else
      render:edit
    end
  end

  def confirm
  end
  
  private
  def get_params
    params.require(:picture).permit(:title, :image, :image_cache, :content)
  end

  def find_params_object
    @picture = Picture.find(params[:id])
  end

  def link_current_user
    @picture = current_user.pictures.new(get_params)
  end
end
