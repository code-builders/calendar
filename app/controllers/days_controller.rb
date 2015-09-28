class DaysController < ApplicationController
  before_action :find_day, only: [:show, :edit, :update]
  def show
  end

  def today
    @day = Day.find_by(date: Date.today)
    render :show
  end

  def new
    @day = Day.new
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
    date = Date.parse(params[:id].remove("-"))
    @day = Day.find_by(date: date)
  end
end
