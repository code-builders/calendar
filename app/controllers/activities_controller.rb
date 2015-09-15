class ActivitiesController < ActionController::Base

  def new
    @day = Day.find(params[:day_id])
    @activity = Activity.new
  end

  def create
    @day = Day.find(params[:day_id])
    @activity = @day.activities.new(activities_params)
      if @activity.save
        respond_to do |format|
          format.html do
            flash[:notice] = "Activity Posted"
            redirect_to day_path(@day)
          end
          format.js
        end
      else
        respond_to do |format|
          format.html do
        flash[:notice] = "Error in activity submission."
        render :new
      end
      format.js
      end
    end
  end

  def edit
    @day = Day.find(params[:day_id])
    @activity = Activity.find(params[:id])
  end

  def destroy
    @day = Day.find(params[:day_id])
    @activity = Activity.find(params[:id])
    @activity.destroy
    flash[:notice] = "Your activity has been removed."
    redirect_to day_path(@day)
  end

  def update
    @day = Day.find(params[:day_id])
    @activity = Activity.find(params[:id])
    if @activity.update(params[:activity])
      redirect_to day_path(@day)
    else
      render :edit
    end
  end

  def activities_params
    params.require(:activity).permit(:text, :url, :start_time, :end_time, :day_id)
  end
end
