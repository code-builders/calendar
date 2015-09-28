class Activity < ActiveRecord::Base
  belongs_to :day
  has_paper_trail
  validates :start, :end, :body, presence: true
end
