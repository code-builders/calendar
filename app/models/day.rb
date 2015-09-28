require 'active_support/core_ext/integer/inflections'

class Day < ActiveRecord::Base
  validates :date, uniqueness: true, presence: true
  has_many :activities

  def to_param
    "#{date.strftime("%B")}-#{date.day.ordinalize}-#{date.year}"
  end
end
