class MyListsController < ApplicationController
  before_action :get_my_list, only: [:edit, :show, :destroy, :update]

  def update
    if @my_list.update_attributes(my_list_params)
      redirect_to my_lists_path
    else
      render :edit
    end
  end

  def create
    @my_list = current_user.lists.new(my_list_params)
    if @my_list.save
      redirect_to my_lists_path
    else
      render :new
    end
  end

  def destroy
    @my_list.destroy
    redirect_to my_lists_path
  end

  def edit

  end

  def show
    @task = @my_list.tasks.new
  end

  def index
    @my_lists = List.all.where(user_id: current_user.id)
  end

  def new
    @my_list = List.new
  end

  private

  def my_list_params
    params.require(:list).permit(:name, :user_id)
  end

  def get_my_list
    @my_list = current_user.lists.find(params[:id])
  end
end
