class ProfilesController < ApplicationController
  before_action :get_profile, only: [:update, :edit]

  def update
    if @profile.update_attributes(profile_params)
      redirect_to user_path(@profile)
    else
      render :edit
    end
  end

  def edit

  end

  private

  def profile_params
    params.require(:user).permit(:age, :first_name, :last_name, :email, :password, :password_confirmation)
  end

  def get_profile
    @profile = User.find(params[:id])
  end
end
