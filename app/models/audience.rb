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

  has_and_belongs_to_many :area
  has_many :population_metrics, :through => :area

end
