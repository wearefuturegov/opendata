# == Schema Information
#
# Table name: populations
#
#  id          :integer          not null, primary key
#  date        :date
#  gender      :string           not null
#  count       :integer
#  audience_id :integer
#  area_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Population < ActiveRecord::Base
  belongs_to :area
  belongs_to :audience

  validates_presence_of :gender, :date, :count

  def self.with_gender(gender)
    where(gender: gender)
  end

  def self.current_year
    where("extract(year from date) = ?", Date.current.year)
  end

  def prediction?
    self.year > Time.now.year
  end

  def change(population)
    (population.count - population.previous_year.count) * 100
  end

  def previous_year
    Population.order("date DESC").where(:date < self.date).first
  end
end
