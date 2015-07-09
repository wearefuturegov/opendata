class FundVertical < ActiveRecord::Base

  enum trend: [:increase, :decrease]

  validates_presence_of :title, :council_spend

  belongs_to :area
  belongs_to :audience

end
