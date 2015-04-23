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
    if @task.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def update
    if @task.update_attributes(task_params)
      redirect_to list_path(@list)
    end
  end

  def destroy
    @task.destroy
    redirect_to list_path(@list)
  end

  private

  def get_list
    @list = List.find(params[:list_id])
  end

  def get_task
    @task = @list.tasks.find(params[:id])
  end
end
