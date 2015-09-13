class Activity < ActiveRecord::Base
  validates :text, :start_time, :end_time, :link, :presence => true
  belongs_to :days
end
