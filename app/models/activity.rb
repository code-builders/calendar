class Activity < ActiveRecord::Base
  belongs_to :day
  has_paper_trail
  validates :start, :end, :link, :body, presence: true
end
