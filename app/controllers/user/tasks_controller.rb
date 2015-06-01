class User::TasksController < User::UserController
  expose(:task) { Task.find(params[:id]) }
  expose(:tasks)
  expose(:list)

  def create
    task = Task.new(task_params)
    task.list_id = list.id
    if task.save
      redirect_to user_list_path(list)
    else
      redirect_to :back, flash: {error: 'Your task must have title at least.'}
    end
  end

  def new
    task = Task.new
  end

  def update
    if task.update_attributes(task_params)
      redirect_to user_list_path(list)
    else
      redirect_to :back, flash: {error: 'Your task must have title at least.'}
    end
  end

  def destroy
    task.destroy
    redirect_to user_list_path(list)
  end

  private

  def task_params
    params.require(:task).permit(:start_at, :end_at, :title, :description, :latitude, :longitude)
  end
end
