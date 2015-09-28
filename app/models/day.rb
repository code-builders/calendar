require 'active_support/core_ext/integer/inflections'

class Day < ActiveRecord::Base
  has_paper_trail
  validates :date, uniqueness: true, presence: true
  has_many :activities, -> { order "start asc" }

  def to_param
    "#{date.strftime("%B")}-#{date.day.ordinalize}-#{date.year}"
  end
end
