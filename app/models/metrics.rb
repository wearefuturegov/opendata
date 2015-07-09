class Metric < ActiveRecord::Base

  validates_presence_of :title, :date, :count

  belongs_to :audience
  belongs_to :area

end
