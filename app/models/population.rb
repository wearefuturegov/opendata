class Population < ActiveRecord::Base

  enum gender: [:male, :female]

  belongs_to :area
  belongs_to :audience

  validates_presence_of :gender, :date, :count

  def prediction?
    if self.year > Time.now.year
  end

  def change(population)
    (population.count - population.previous_year.count) * 100
  end

  def previous_year
    Population.order(:date DESC).where(:date < self.date).first
  end

end
