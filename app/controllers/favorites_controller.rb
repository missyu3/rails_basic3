class FavoritesController < ApplicationController
  def create
  @favorite = current_user.favorites.new(picture_id: params[:picture_id])
    if @favorite.save
      redirect_to pictures_path
    else
      render :new
    end
  end

  def index
    user = User.find_by(id: params[:user_id])
    @user = user
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    if @favorite.destroy
      redirect_to pictures_path
    else
      render :new
    end
  end
end
