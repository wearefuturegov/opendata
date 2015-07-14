class Audience < ActiveRecord::Base

  has_and_belongs_to_many :area
  has_many :population_metrics, :through => :area

end
