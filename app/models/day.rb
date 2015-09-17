require 'elasticsearch/model'
class Day < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  validates :description, :date, :url, :presence => true
  default_scope -> { order(date: :asc) }
  has_many :activities

  include Searchable
  searchkick
  Day.import
    def results
      if @query.present?
        self.class.search(@query).preload(:searchable).map!(&:searchable).uniq.sort_by{|e| -e.created_at.to_i}
      else
        Search.none
      end
    end
end
