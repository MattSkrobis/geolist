class MyListsController < ApplicationController
  before_action :get_list, only: [:edit, :show, :destroy, :update]

  def update
    if @list.update_attributes(list_params)
      redirect_to my_lists_path
    else
      render :edit
    end
  end

  def create
    @list = current_user.lists.new(list_params)
    if @list.save
      redirect_to my_lists_path
    else
      render :new
    end
  end

  def destroy
    @list.destroy
    redirect_to my_lists_path
  end

  def edit

  end

  def show
    @task = Task.new
  end

  def index
    @lists = List.all.where(user_id: current_user.id)
  end

  def new
    @list = List.new
  end

  private

  def list_params
    params.require(:list).permit(:name, :user_id)
  end

  def get_list
    @list = current_user.lists.find(params[:id])
  end
end
