class PicturesController < ApplicationController
  before_action :find_params_object, only:[:edit, :update, :show, :destroy]

  def index
    @pictures = Picture.all
  end

  def new
    if params[:back]
      @picture = Picture.new(get_parms)
    else
      @picture = Picture.new
    end
  end

  def create
    @picture = Picture.new(get_parms)
    if @picture.save
      redirect_to pictures_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @picture.update(get_parms)
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
    @picture = Picture.new(get_parms)
  end
  
  private
  def get_parms
    params.require(:picture).permit(:title, :image, :image_cache, :content)
  end

  def find_params_object
    @picture = Picture.find(params[:id])
  end

end
