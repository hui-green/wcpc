class VisitorsController < ApplicationController
  layout "wechat"
  before_action :set_wechat_user
  def index
    @photographs = @activity.photographs.paginate(:page => params[:page])
  end

  def ranking
    @photographs = @activity.photographs.order("vote_numbers desc").paginate(:page => params[:page])
  end

  def intro
  end

  def show
    @photograph = Photograph.find(params[:id])
  end

  private


end
