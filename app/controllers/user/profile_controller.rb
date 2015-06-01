class User::ProfileController < User::UserController
  expose(:profile, model: :user)
  expose(:exp_tasks) { profile_tasks }

  def update
    if profile.update_attributes(profile_params)
      redirect_to user_profile_path
    else
      render :edit
    end
  end

  def profile
    current_user
  end

  private

  def profile_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def profile_tasks
    profile.close_to(profile.latitude, profile.longitude).inject([]) do |result, task|
      result << {:latlng => [task.latitude, task.longitude], :popup => task.title}
    end
  end
end
