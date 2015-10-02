class Activity < ActiveRecord::Base
  belongs_to :day
  has_paper_trail
  validates :start, :end, :body, presence: true
  scope :by_start, -> { order(start: :asc) }
  scope :required, -> { where(required_learning: true) }
end
