class Activity < ActiveRecord::Base
  validates :text, :start_time, :end_time, :url, :presence => true
  belongs_to :days
  default_scope { order('start_time') } 
end
