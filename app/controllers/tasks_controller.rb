class TasksController < ApplicationController
  expose(:list)
  expose(:task) { list.tasks.find(params[:id]) }

  def update
    if task.update_attributes(task_params)
      task.assignee_id = params[:task][:assignee_id]
      task.assigned = params[:task][:assigned]
      redirect_to user_profile_path
    else
      redirect_to list_path(list), flash: {error: 'Something was wrong, please try again.'}
    end
  end

  private

  def task_params
    params.require(:task).permit(:start_at, :end_at, :title, :description, :assigned, :assignee_id, :latitude, :longitude)
  end
end

