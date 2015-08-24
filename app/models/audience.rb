# == Schema Information
#
# Table name: audiences
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Audience < ActiveRecord::Base
  has_many :populations
  has_and_belongs_to_many :area
  has_many :population_metrics, :through => :area

  def total_population_at(year)
    populations.where("extract(year from \"date\") = ?", year).sum(:count)
  end

  def total_population_percent_change(from, to)
    raise ArgumentError if from.nil? || to.nil?
    initial = total_population_at(from).to_f
    final = total_population_at(to).to_f
    change = (final - initial) / initial * 100
  end
end
