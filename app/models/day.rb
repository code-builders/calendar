require 'active_support/core_ext/integer/inflections'

class Day < ActiveRecord::Base
  has_paper_trail
  validates :date, uniqueness: true, presence: true
  has_many :activities, -> { order "start asc" }

  def yesterday
    param_date date - 1
  end

  def tomorrow
    param_date date + 1
  end

  def to_param
    param_date date
  end

  def param_date(date)
    "#{date.strftime("%B")}-#{date.day.ordinalize}-#{date.year}"
  end
end
