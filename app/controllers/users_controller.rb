class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[show edit]

  def show
    @user = current_user
    return unless @user != User.find(params[:id])

    flash[:alert] = 'Vous ne pouvez pas voir ce profil.'
    redirect_back fallback_location: root_path
  end

  def edit
    @user = current_user
    return unless @user != User.find(params[:id])

    flash[:alert] = 'Vous ne pouvez pas éditer ce profil.'
    redirect_back fallback_location: root_path
  end

  def update
    @user = User.find(params['id'])
    if @user == current_user
      if @user.update(user_params)
        flash[:success] = 'Votre profil a bien été mis à jour'
        redirect_to @user
      else
        flash[:error] = "Votre profil n'a pas pu être mis à jour"
        render :edit, status: :unprocessable_entity
      end
    else
      flash[:alert] = 'Vous ne pouvez pas éditer ce profil.'
      redirect_back fallback_location: root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :description)
  end
end
