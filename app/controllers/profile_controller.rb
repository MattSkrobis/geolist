class ProfileController < ApplicationController
  expose(:profile, model: :user)

  def update
    if profile.update_attributes(profile_params)
      redirect_to user_path(profile)
    else
      render :edit
    end
  end

  def edit

  end
  def profile
    current_user
  end

  private

  def profile_params
    params.require(:user).permit(:age, :first_name, :last_name, :email, :password, :password_confirmation)
  end

end
