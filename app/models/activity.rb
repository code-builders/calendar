class Activity < ActiveRecord::Base
  default_scope -> { order("start asc") }
  belongs_to :day
  has_paper_trail
  validates :start, :end, :body, presence: true
end
