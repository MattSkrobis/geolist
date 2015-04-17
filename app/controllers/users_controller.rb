class UsersController < ApplicationController
  expose(:user, attributes: :user_attributes)


  def update
    if user.save
      redirect_to(user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:age, :first_name, :last_name)
  end
end
