class Day < ActiveRecord::Base
  validates: :description, :date, :link_to, :presence => true
end
