class Area < ActiveRecord::Base

  has_and_belongs_to_many :audiences

  validates :name, presence: true, uniqueness: true
  validates :total_population, presence: true, numericality: true
  validates :total_population_male, presence: true, numericality: true
  validates :total_population_female, presence: true, numericality: true

end
