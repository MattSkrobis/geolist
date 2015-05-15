class ListsController < ApplicationController
  expose(:lists)
  expose(:list)
  expose(:task)

  def index
    @q = List.search(params[:q])
    @lists = @q.result.includes(:tasks).to_a.uniq
  end
end
