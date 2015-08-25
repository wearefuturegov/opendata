# == Schema Information
#
# Table name: fund_verticals
#
#  id            :integer          not null, primary key
#  title         :string
#  council_spend :integer
#  nhs_spend     :integer
#  trend         :integer
#  area_id       :integer
#  audience_id   :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class FundVertical < ActiveRecord::Base

  enum trend: [:increase, :decrease]

  validates_presence_of :title, :council_spend

  belongs_to :area
  belongs_to :audience

  def self.with_audience(audience)
    where(audience: audience)
  end

  def direction
    return "positive" if trend == :increase
    return "negative" if trend == :decrease
    return "static"
  end
end
