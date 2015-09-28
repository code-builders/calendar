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

  def destroy
    @activity = @day.activities.find(params[:id])
    @activity.destroy
    redirect_to @day
  end
  private

  def find_day
    date = Date.parse(params[:day_id].remove("-"))
    @day = Day.find_by(date: date)
  end
end
