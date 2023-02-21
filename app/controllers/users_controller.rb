class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    @user = current_user
    return unless @user != User.find(params[:id])

    flash[:alert] = 'Vous ne pouvez pas voir ce profil.'
    redirect_back fallback_location: root_path
  end
end
