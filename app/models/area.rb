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

  validates :name, presence: true, uniqueness: true

end
