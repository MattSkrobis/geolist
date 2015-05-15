class User::ListsController < User::UserController
  expose(:lists) { List.all.where(owner_id: current_user.id) }
  expose(:list, model: :list)
  expose(:task) { list.tasks.new }

  def update
    if list.update_attributes(list_params)
      redirect_to user_lists_path
    else
      render :edit
    end
  end

  def create
    list = current_user.lists.new(list_params)
    if list.save
      redirect_to user_lists_path
    else
      render :new
    end
  end

  def destroy
    list.destroy
    redirect_to user_lists_path
  end

  private

  def list_params
    params.require(:list).permit(:name, :owner_id)
  end
end
