# == Schema Information
#
# Table name: areas
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  live       :boolean          default(FALSE)
#

class Area < ActiveRecord::Base
  has_and_belongs_to_many :audiences
  has_many :populations

  validates :name, presence: true, uniqueness: true

  def total_population_percent_by_gender(gender)
    (total_population_by_gender(gender).to_f / total_population) * 100
  end

  def total_population_by_gender(gender)
    populations.current_year.with_gender(gender).sum(:count)
  end

  def total_population
    populations.current_year.sum(:count)
  end
end
