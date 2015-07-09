class Area < ActiveRecord::Base

  has_and_belongs_to_many :audiences

  validates :name, presence: true, uniqueness: true

end
