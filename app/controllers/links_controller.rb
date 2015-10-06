class LinksController < ApplicationController
  def create
    @activity = Activity.find(params[:activity_id])
    @activity.links.new(params.require(:link).permit!)
    if @activity.save
      redirect_to @activity.day
    else
      render "activity/edit"
    end
  end
end
