class DaysController < ApplicationController
  before_action :find_day, only: [:show, :edit, :update]
  def index
    @days = Day.order("date asc").includes(:activities)
  end

  def show
    @day ||= Day.new(date: @date)
  end

  def today
    @day = Day.find_or_initialize_by(date: Date.today)
    render :show
  end

  def new
    @day = Day.new(date: params[:date])
  end

  def create
    @day = Day.new(params.require(:day).permit!)
    if @day.save
      redirect_to @day
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @day.update(params.require(:day).permit(:body))
      redirect_to @day
    else
      render :edit
    end
  end

  private

  def find_day
    @date = Date.parse(params[:id].remove("-"))
    @day = Day.find_by(date: @date)
  end
end
