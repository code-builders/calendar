class Day < ActiveRecord::Base
  validates :description, :date, :url, :presence => true
  has_many :activities




end
