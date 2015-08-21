# == Schema Information
#
# Table name: population_metrics
#
#  id          :integer          not null, primary key
#  date        :date
#  count       :integer
#  title       :string
#  area_id     :integer
#  audience_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class PopulationMetric < ActiveRecord::Base

  validates_presence_of :title, :date, :count

  belongs_to :audience
  belongs_to :area

end
