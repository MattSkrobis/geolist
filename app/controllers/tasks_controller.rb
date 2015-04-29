class TasksController < ApplicationController
  before_action :get_list
  before_action :get_task, only: [:destroy, :update, :edit]

  def new
    @task = Task.new
  end

  def edit

  end

  def create
    @task = Task.new(task_params)
    @task.list_id = @my_list.id
    if @task.save
      redirect_to my_list_path(@my_list)
    else
      render :new
    end
  end

  def update
    if @task.update_attributes(task_params)
      redirect_to my_list_path(@my_list)
    end
  end

  def destroy
    @task.destroy
    redirect_to my_list_path(@my_list)
  end

  private

  def task_params
    params.require(:task).permit(:start_at, :end_at, :title, :description)
  end

  def get_list
    @my_list = List.find(params[:my_list_id])
  end

  def get_task
    @task = @my_list.tasks.find(params[:id])
  end
end
