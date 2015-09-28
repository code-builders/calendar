class ActivitiesController < ApplicationController
  before_action :find_day

  def create
    @activity = @day.activities.create(params.require(:activity).permit!)
    if @activity.save
      redirect_to @day
    else
      render "/days/show"
    end
  end
  private

  def find_day
    date = Date.parse(params[:day_id].remove("-"))
    @day = Day.find_by(date: date)
  end
end
