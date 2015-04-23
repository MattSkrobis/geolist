class ListsController < ApplicationController
  before_action :get_list, only: [:show]

  def index
    @lists = List.all
  end

  def show

  end

  private

  def get_list
    @list = List.find(params[:id])
  end
end
