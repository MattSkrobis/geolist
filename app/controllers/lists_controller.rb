class ::ListsController < ApplicationController
  # before_action :get_list, only: [:show]
  expose(:lists)
  expose(:list)
  expose(:task)

  def index
    @q = List.search(params[:q])
    @lists = @q.result.includes(:tasks).to_a.uniq

  end
  # def show
  #
  # end
  #
  # private
  #
  # def get_list
  #   list = List.find(params[:id])
  # end
end
