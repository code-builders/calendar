class Day < ActiveRecord::Base
  validates :description, :date, :url, :presence => true
  has_many :activities
  belongs_to :searchable, polymorphic: true

  def results
    if @query.present?
      self.class.search(@query).preload(:searchable).map!(&:searchable).uniq
    else
      Search.none
    end
  end

end
